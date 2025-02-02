<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/resources/css/tourplace.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Home</title>
</head>

<script type="text/javascript">
window.onload = function(){
	const searchButton = document.querySelector('#searchButton');
	searchButton.addEventListener("click", function(){
		getSearchList(null);
	});
	
	getSearchList(null);
}


function getSearchList(selectedIdx){
	
	//let pageIdx = new URLSearchParams(location.search).get("pageIdx");
	//if(pageIdx == null){
	//	pageIdx = 1;
	//}
	let pageIdx = selectedIdx;
	if(selectedIdx == null){
		pageIdx = 1;
	}
	
	const inputKeyword = document.querySelector("#search_keyword");
	
	const url = "/tourplace/getSearchList";
	const params = {
		keyword : inputKeyword.value,
		pageRowStartIdx : (pageIdx-1)*showPageCount,
		showPageCount : showPageCount
	}
	
	fetch(url, {
		method: 'POST',
		headers: {'Content-Type': 'application/json'},
			body: JSON.stringify(params) // JSON 형식으로 데이터 전송
		})
	.then(response => response.json())
	.then(data => {
		
		totalSearchListSize = data.totalListSize;
		
		//검색 데이터를 뿌림
		tourplaceToBoard(data.searchList);
		
		//인덱스를 그림
		tourplaceToPageIndex();
		
	})
	.catch(error => {
		console.error('Error:', error);
	});
	
}
 
function tourplaceToBoard(dataList){
	
	const targetDiv = document.querySelector("#searchResultTable");
	targetDiv.innerHTML = '';
	
	const rowContentCnt = 5;
	let idx = 0;
	let newRow = document.createElement("tr");
	dataList.forEach( (item) => {
		
		if(idx == 0){
			newRow = document.createElement("tr");
			targetDiv.appendChild(newRow);
		}
		
		const newTd = document.createElement("td");
		const newDivCode = document.createElement("div");
		
		const inner_box= document.createElement("div");
		
		const newDivName = document.createElement("div");
	
		newTd.innerHTML = item.imgTag;
		newDivCode.innerHTML = item.touristCode;
		newDivName.innerHTML = item.touristName;
		
		newTd.appendChild(newDivCode);
		newTd.appendChild(newDivCode);
		newTd.appendChild(newDivName);
		
		newRow.appendChild(newTd);
		
		idx++;
		if(idx == rowContentCnt){
			idx = 0;
		}
		
	});
	
}

let currentIndexBundle = 1;
let totalSearchListSize = 0;
let showPageCount = 15;
const indexBundleSize = 10;
function tourplaceToPageIndex(){
	
	const pageIdxDiv = document.querySelector("#searchResultPageIndex");
	pageIdxDiv.innerHTML = "";
	
	let totalIdxCount = (totalSearchListSize/showPageCount).toFixed();
	if(totalSearchListSize%showPageCount > 0){
		totalIdxCount++;
	}
	
	let totalIdxBundleCount = (totalIdxCount/indexBundleSize).toFixed();
	if(totalIdxCount%indexBundleSize > 0){
		totalIdxBundleCount++;
	}
	
	// drawIndexCount : 그려질 인덱스 개수
	// Bundle 현재 페이지가 끝Bundle까지 왔을때
	let drawIndexCount = 0;
	if(currentIndexBundle==totalIdxBundleCount){
		drawIndexCount = totalIdxCount%indexBundleSize;
		
		if(totalIdxCount%indexBundleSize == 0){
			drawIndexCount = indexBundleSize;
		}
	}else{
		drawIndexCount = indexBundleSize;
	}

	let previousBundle = document.createElement("a");
	previousBundle.innerHTML = "◀"; 
	pageIdxDiv.appendChild(previousBundle);
	pageIdxDiv.innerHTML = pageIdxDiv.innerHTML + " ";
	for(let i = 1; i <= drawIndexCount; i++){
		
		let newIdx = document.createElement("a");
		let idxNumber = i+((currentIndexBundle-1)*indexBundleSize);
		newIdx.innerHTML = idxNumber;
		newIdx.setAttribute("onclick", "getSearchList("+idxNumber+")");
		
		pageIdxDiv.appendChild(newIdx);
		pageIdxDiv.innerHTML = pageIdxDiv.innerHTML + " ";
	}
	let nextBundle = document.createElement("a");
	nextBundle.innerHTML = "▶";  
	pageIdxDiv.appendChild(nextBundle);
	pageIdxDiv.innerHTML = pageIdxDiv.innerHTML + " ";
	
	// 
	
}
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="tourlist_board">
		<table class="search_table">
			<tr>
				<td class="search_header">관광타입</td>
				<td class="search_content">관광지</td>
			</tr>
			<tr>
				<td class="search_header">검색어</td>
				<td class="search_content input_form"><input
					style="float: left;" type="text" id="search_keyword" value="" /> <input
					style="width: 100px; margin-left: 5px;" type="button"
					id="searchButton" value="검색" /></td>
			</tr>
		</table>
	</div>

	<!-- 	<h1>관광지 목록</h1> -->
	<br>
	<%-- <table class="listTilte">
		<tr>
			<th>번호</th>
			<th>관광지명</th>
			<th>관광지 주소</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.touristCode}</td>
				<td>${item.touristName}</td>
				<td>${item.touristAddress}</td>
				<td>${item.look}</td>
				<td>${item.imgTag}</td>
			</tr>
		</c:forEach>
	</table>  --%>

	<!-- 페이징 뿌리기  -->
	<%-- <c:set var="pageIdx" value="0"/>
	<c:forEach begin="1" end="${maxPage}">
		<c:set var="pageIdx" value="${pageIdx+1}"/>
		<a href="/tourplace/search?pageIdx=${pageIdx}">${pageIdx}</a>
	</c:forEach> --%>

	<div class="photoList">
		<div class="photoList_div">


			<div id="searchResultPageIndex"></div>
			<table id="searchResultTable">
			</table>

			<%-- <c:forEach items="${list}" var="item">
			<div class="box">
				${item.imgTag}
				<div>
					${item.touristCode}
				</div>	
				<div>
					${item.touristName}
				</div>
			</div>
		</c:forEach> --%>
	</div> 
</div>

<div class="return-top">
<a href="#"> <span class="element3">Top</span></a>
</div>
<footer class="bg-success pt-4">
		<div class="w-100 bg-success py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-lg-5 col-sm-12">
						<p class="text-center text-light light-300">© 전국을 만나는 순간 2024
							| 금쪽같은 코딩</p>
					</div>
				</div>
			</div>
		</div>
</footer>
<script src="/resources/js/tourselect.js"></script>
</body>
</html>