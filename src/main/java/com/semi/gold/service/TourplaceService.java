package com.semi.gold.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.TourplaceDAO;
import com.semi.gold.model.dto.TourplaceSearchDTO;
import com.semi.gold.model.vo.TourPlace;

@Service
public class TourplaceService {

	@Autowired
	private TourplaceDAO dao;

	public List<TourPlace> showTourplace() {

		List<TourPlace> returnList = dao.showTourplace();
		settingImages(returnList);

		return returnList;
	}

	/**
	 * 매개변수로 들어온 리스트에 이미지 태그 값을 세팅해 주는 메소드
	 * 
	 * @param tourplaceList
	 */
	public void settingImages(List<TourPlace> tourplaceList) {

//		for(int i=0; i<tourplaceList.size();i++) {
//			TourPlace tp = tourplaceList.get(i);
//		}

		Map<String, String> imgMap = getImgMap();

		for (TourPlace tp : tourplaceList) {
			tp.setImgTag(imgMap.get(tp.getTouristName()));
//			tp.setImgTag("<img class='tourplaceMainImg' src='/resources/image/tourplace/국립장성숲체원_1_공공3유형.JPG' alt='이미지 없음'>");
//			   <img src="images/200x200.png" alt="My Image">
		}

	}

	// 이미지 파일이든 폴더를 읽어와서, file객체에 모두 담은 후 Map으로 반환한다.
	public Map<String, String> getImgMap() {
		Map<String, String> tourplaceImgMap = new HashMap<String, String>();

//		File dir = new File("src/main/webapp/resources/image/tourplace");
		File dir = new File("D:/spring-workspace/gold-semi/src/main/webapp/resources/image/tourplace");

		File files[] = dir.listFiles();
		for (File file : files) {

			String tourplaceName = file.getPath().replace('\\', '/');

			String tempPath1 = "src/main/webapp/resources/image/tourplace/";
//			tourplaceName = tourplaceName.substring(0, tempPath.length()+tourplaceName.indexOf(tempPath));
//			tourplaceName = tourplaceName.substring(0, tourplaceName.indexOf("_"));
			tourplaceName = tourplaceName.substring(tempPath1.length() + tourplaceName.indexOf(tempPath1));
			tourplaceName = tourplaceName.substring(0, tourplaceName.indexOf("_"));

			String filePath = file.getPath().replace('\\', '/');
			String tempPath2 = "src/main/webapp";
//			filePath = filePath.substring("src/main/webapp".length());
			filePath = filePath.substring(tempPath2.length() + filePath.indexOf(tempPath2));

//			"<img class='tourplaceMainImg' src='/resources/image/tourplace/국립장성숲체원_1_공공3유형.JPG'
//			alt='이미지 없음'>"
			String imgTagValue = "<img class='tourplaceMainImg' src='" + filePath + "' alt='이미지 없음'>";

			if (!tourplaceImgMap.containsKey(tourplaceName)) {
				tourplaceImgMap.put(tourplaceName, imgTagValue);
			}

		}

		return tourplaceImgMap;
	}
	
	public List<TourPlace> searchTourplace(TourplaceSearchDTO dto) {

		List<TourPlace> returnList = dao.searchTourplace(dto);
		settingImages(returnList);

		return returnList;
	}

}