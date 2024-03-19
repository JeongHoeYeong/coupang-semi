<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/resources/css/tourplace.css" rel="stylesheet"
	type="text/css">
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
		tourplaceToBoard(data.searchList);
		tourplaceToPageIndex(data.totalListSize);
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
		const newDivName = document.createElement("div");
		newTd.innerHTML = item.imgTag;
		newDivCode.innerHTML = item.touristCode;
		newDivName.innerHTML = item.touristName;
		
		newTd.appendChild(newDivCode);
		newTd.appendChild(newDivName);
		
		newRow.appendChild(newTd);
		
		idx++;
		if(idx == rowContentCnt){
			idx = 0;
		}
		
	});
	
}

let showPageCount = 30;
function tourplaceToPageIndex(totalListSize){

	const pageIdxDiv = document.querySelector("#searchResultPageIndex");
	pageIdxDiv.innerHTML = "";
	
	let totalIdxCount = totalListSize/showPageCount;
	if(totalListSize%showPageCount > 0){
		totalIdxCount++;
	}
	
	for(let i = 1; i < totalIdxCount; i++){
		let newIdx = document.createElement("a");
		newIdx.innerHTML = i;
		newIdx.setAttribute("onclick", "getSearchList("+i+")");
		
		pageIdxDiv.appendChild(newIdx);
		
		pageIdxDiv.innerHTML = pageIdxDiv.innerHTML + " ";
	}
	
}
</script>

</head>

<body>
	<div class="tourlist_board">
		<table class="search_table">
			<tr>
				<td class="search_header">관광타입</td>
				<td class="search_content">관광지</td>
			</tr>
			<tr>
				<td class="search_header">검색어</td>
				<td class="search_content input_form">
				<input style="float: left;" type="text" id="search_keyword" value=""/> 
				<input style="width: 100px; margin-left: 5px;" type="button"
					id="searchButton" value="검색"/></td>
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
	
		<table id="searchResultTable">
		</table>
		
		<div id="searchResultPageIndex">
		</div>
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
<script src="/resources/js/tourselect.js"></script>
</body>
</html>