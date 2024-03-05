package com.semi.gold.excel;

import java.io.FileInputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.semi.gold.model.vo.TourPlace;

//1. webapp/resources/parsingExcel에 파싱할 엑셀 복사
//2. 생성자의  path경로의 파일명 수정
//3. columns 배열의 값 엑셀의 컬럼명으로 수정
//4. insert할 vo로 변경
//5. insert할 mybatis mapper 변경
//6. main 실행
public class TourplaceExcelParsing {

	public TourplaceExcelParsing() {

			parsingExcel("src/main/webapp/resources/parsingExcel/관광지 텍스트.xls");

	}

	public void parsingExcel(String filePath) {

		try {
			FileInputStream file = new FileInputStream(filePath);
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			List<TourPlace> voDataList = new ArrayList<>();

			String[] columns = { "명칭", "우편번호", "관리자", "전화번호", "주소", "위도", "경도", "개요", "유산구분", "문의 및 안내", "개장일", "쉬는날",
					"체험안내", "체험가능연령", "수용인원", "이용시기", "이용시간", "주차시설", "유모차 대여 여부", "애완동물 동반 가능 여부", "신용카드 가능 여부",
					"상세정보" };

			// 시트 수 (첫번째에만 존재하므로 0을 준다)
			// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			HSSFSheet sheet = workbook.getSheetAt(0);
			// 행의 수
			int rows = sheet.getPhysicalNumberOfRows();

			for (int rowindex = 1; rowindex < rows; rowindex++) {

				// MAP >
				Map<String, String> excelRow = new HashMap<String, String>();

				// 행을읽는다
				HSSFRow row = sheet.getRow(rowindex);
				if (row != null) {
					// 셀의 수
					for (int columnindex = 0; columnindex < columns.length; columnindex++) {
						// 셀값을 읽는다
						HSSFCell cell = row.getCell(columnindex);
						String value = getCellValue(cell);

						excelRow.put(columns[columnindex], value);
					}
				}

				TourPlace vo = new TourPlace();
				vo.setTouristName(excelRow.get("명칭"));
				vo.setTouristAddress(excelRow.get("주소"));
				vo.setLook(0);
				voDataList.add(vo);
			}

			insertExcelData(voDataList);

			workbook.close();

		} catch (Exception e) {
			e.printStackTrace();
		} 

	}

	public void insertExcelData(List<TourPlace> voList) {
		try {

			Reader r = Resources.getResourceAsReader("mybatis-config.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
			SqlSession session = factory.openSession();

			for (int i = 0; i < voList.size(); i++) {

				TourPlace tour = voList.get(i);
				session.insert("tourPlaceMapper.insertTourPlace", tour);

			}
			session.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getCellValue(HSSFCell cell) {

		String returnVal = "";
		if (cell == null) {
			returnVal = "";
		} else {
			// 타입별로 내용 읽기
			switch (cell.getCellType()) {
			case FORMULA:
				returnVal = cell.getCellFormula();
				break;
			case NUMERIC:
				returnVal = cell.getNumericCellValue() + "";
				break;
			case STRING:
				returnVal = cell.getStringCellValue() + "";
				break;
			case BLANK:
				returnVal = cell.getBooleanCellValue() + "";
				break;
			case ERROR:
				returnVal = cell.getErrorCellValue() + "";
				break;
			default:
				break;
			}
		}

		return returnVal;
	}

	public static void main(String[] args) {
		new TourplaceExcelParsing();

	}

}
