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
	
	const url = "/restaurant/getSearchList";
	const params = {
		keyword : inputKeyword.value,
		pageIdx : pageIdx,
		showPageCount : showPageCount
	}
	
	fetch(url, {
		method: 'POST',
		headers: {'Content-Type': 'application/json'},
			body: JSON.stringify(params) // JSON 형식으로 데이터 전송
		})
	.then(response => response.json())
	.then(data => {
		
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
		//totalSearchListSize = data.totalListSize;
		
		const newTd = document.createElement("td");
		const newDivCode = document.createElement("div");
		
		const inner_box= document.createElement("div");
		
		const newDivName = document.createElement("div");
	
		//"<img class='tourplaceMainImg' src='" + filePath + "' alt='이미지 없음'>";
		let imgUrl = item.imgTag;
		if(!(imgUrl.length > 0)){
			imgUrl = "http://localhost:8080/resources/image/restaurant/no_image.png"
		}
		newTd.innerHTML = "<img class='tourplaceMainImg' src='" + imgUrl + "' alt='이미지 없음'>";
		
		newDivCode.innerHTML = "";
		newDivName.innerHTML = item.restaurantName;
		totalSearchListSize = item.totalCount;
		
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
let totalIdxBundleCount = 0;
let showPageCount = 15;
const indexBundleSize = 10;
function tourplaceToPageIndex(){
	
	const pageIdxDiv = document.querySelector("#searchResultPageIndex");
	pageIdxDiv.innerHTML = "";
	
	let totalIdxCount = (totalSearchListSize/showPageCount).toFixed();
	if(totalSearchListSize%showPageCount > 0){
		totalIdxCount++;
	}
	
	totalIdxBundleCount = (totalIdxCount/indexBundleSize).toFixed();
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
	if(currentIndexBundle > 1){
		previousBundle.innerHTML = "◀";
	} else {
		previousBundle.innerHTML = "◁";
	}
	
	previousBundle.setAttribute("onclick", "clickPreviousBundle()");
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
	if(totalIdxBundleCount > currentIndexBundle){
		nextBundle.innerHTML = "▶"; 
	} else {
		nextBundle.innerHTML = "▷";
	}
	 
	nextBundle.setAttribute("onclick", "clickNextBundle()");
	pageIdxDiv.appendChild(nextBundle);
	pageIdxDiv.innerHTML = pageIdxDiv.innerHTML + " ";
	
	
}

function clickNextBundle(){
	if(totalIdxBundleCount > currentIndexBundle){
		currentIndexBundle++;
		tourplaceToPageIndex();
	}
}

function clickPreviousBundle(){
	if(currentIndexBundle > 1){
		currentIndexBundle--;
		tourplaceToPageIndex();
	}
}

</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="tourlist_detail">
		<table border="1" style="width: 1000px;">
			<colgroup>
				<col width="30%"/>
				<col width="70%"/>
			</colgroup>
			<tr>
				<td>
					식당 이름
				</td>
				<td>
					${restaurant.restaurantName}
				</td>
			</tr>
			<!-- Restaurant(contentId=2851196, restaurantName=친봉산장, restaurantAddress=제주특별자치도 서귀포시 하신상로 417, imgTag=http://tong.visitkorea.or.kr/cms/resource/65/2851165_image2_1.jpg, imgTag2=http://tong.visitkorea.or.kr/cms/resource/65/2851165_image3_1.jpg, areaCode=39, sigunguCode=3, cat1=A05, cat2=A0502, cat3=A05020900, addr1=null, addr2=null, zipCode=63602, overview=친) -->
			<tr>
				<td>
					식당 주소
				</td>
				<td>
					${restaurant.restaurantAddress}
				</td>
			</tr>
			<tr>
				<td>
					대표 이미지
				</td>
				<td>
					<img src="${restaurant.imgTag}" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td>
					상세 설명
				</td>
				<td>
					${restaurant.overview}
				</td>
			</tr>
		</table>
	</div>
	
	
<div class="return-top">
<a href="#"> <span class="element3">Top</span></a>
</div>
<footer class="bg-success pt-4">
		<div class="w-100 bg-success py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-lg-5 col-sm-12">
						<p class="text-center text-light light-300">© 전국을 만난는 순간 2024
							| 금쪽같은 코딩</p>
					</div>
				</div>
			</div>
		</div>
</footer>
<script src="/resources/js/tourselect.js"></script>
</body>
</html>