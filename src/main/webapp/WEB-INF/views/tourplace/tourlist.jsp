<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link href="/resources/css/tourplace.css" rel="stylesheet"
	type="text/css">
<title>Home</title>


</head>

<script type="text/javascript">
window.onload = function(){
	const searchButton = document.querySelector('#searchButton');
	searchButton.addEventListener("click", function(){
		getSearchList();
	});
	
	getSearchList();
}

function getSearchList(){
	
	const inputKeyword = document.querySelector("#search_keyword");
	
	const url = "/tourplace/getSearchList";
	const params = {
		keyword: inputKeyword.value
	}
	
	fetch(url, {
		method: 'POST',
		headers: {'Content-Type': 'application/json'},
			body: JSON.stringify(params) // JSON 형식으로 데이터 전송
		})
	.then(response => response.json())
	.then(data => {
		tourplaceToBoard(data);
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
		
		//const attachDiv = document.createElement("div");
		//
		//attachDiv.classList.add("box");
		//attachDiv.innerHTML = item.imgTag;
		//
		//const divCode = document.createElement("div");
		//divCode.innerHTML = item.touristCode;
		//
		//const divName = document.createElement("div");
		//divName.innerHTML = item.touristName;
		//
		//attachDiv.appendChild(divCode);
		//attachDiv.appendChild(divName);
		//
		//targetDiv.appendChild(attachDiv);
		
	});
	
}
 
</script>
<body>
	<div class="tourlist_board">
		<table class="search_table">
			<tr>
				<td class="search_header">관광타입</td>
				<td class="search_content">관광지</td>
			</tr>
			<tr>
				<td class="search_header">검색어</td>
				<td class="search_content input_form"><input
					style="float: left;" type="text" id="search_keyword"/> <input
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

<div class="photoList">
	<div class="photoList_div">
	
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

</body>
</html>
