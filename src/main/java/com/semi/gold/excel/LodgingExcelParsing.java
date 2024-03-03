package com.semi.gold.excel;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.semi.gold.vo.Lodging;

public class LodgingExcelParsing {

	public static void main(String[] args) {
		
		
	
		try {
			
			Reader r = Resources.getResourceAsReader("mybatis-config.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
			SqlSession session = factory.openSession();
			
			String fileName = "src/main/webapp/resources/parsingExcel/관광지-숙소100.xls";
			
			List<Map<Object, Object>> excelData = readExcel(fileName);
			
			for(int i = 1; i< excelData.size(); i++) {
				Lodging lodging = new Lodging();
				
				Map<Object, Object> map = excelData.get(i);
					System.out.println("명칭 : " + map.get("명칭"));
					System.out.println("전화번호 : " + map.get("전화번호"));
					System.out.println("주소 : " + map.get("주소"));
					
					lodging.setName((String) map.get("명칭"));
					lodging.setNumber((String) map.get("전화번호"));
					lodging.setAddr((String) map.get("주소"));
					
					session.insert("lodgingMapper.insertLodging", lodging);
				    session.commit();
			}
					
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static List<Map<Object, Object>> readExcel(String fileName) throws IOException {
		List<Map<Object, Object>> list = new ArrayList<>();
		
		FileInputStream fis = new FileInputStream(new File(fileName));
		Workbook workbook = new HSSFWorkbook(fis); 
		if(workbook!=null) {
	
			// 여러개의 시트일 경우 for문 쓰기
			
		    Sheet sheet = workbook.getSheetAt(0);
			
		    int rows = sheet.getLastRowNum();
		    
		    for(int i=0; i<=rows; i++) {
		    	Row row = sheet.getRow(i);
		    	if(row!=null) {
		    		int cells = row.getPhysicalNumberOfCells();
		    		list.add(getCell(row, cells));
		    	}
		    }
		
		}
		
		return list;
	}
	
	public static Map<Object, Object> getCell(Row row, int cells){
		Map<Object, Object> map = new HashMap<>();
		
		String[] columns = {"명칭", "우편번호","관리자","전화번호","주소","위도","경도","개요","숙박 종류","문의 및 안내","규모","수용 가능 인원","객실 수","객실 유형","주차 가능", "조리 가능","체크인","체크아웃","예약 안내","예약안내 홈페이지","픽업 서비스","식음료장","부대 시설","세미나","스포츠시설","사우나실","뷰티 시설","노래방","바베큐장","캠프화이어","자전거대여","휘트니스센터","공용 PC실","공용 샤워실","상세정보","환불규정"};
		
		for(int i = 0; i < cells; i++) {
			if(i >= columns.length) {
				break;
			}
			
			Cell cell = row.getCell(i);
			if(cell!=null) {
				switch(cell.getCellType()) {
				case STRING:
					map.put(columns[i], cell.getStringCellValue());
					break;
				case NUMERIC:
					if(DateUtil.isCellDateFormatted(cell)) {
						map.put(columns[i], cell.getDateCellValue());
					} else {
						map.put(columns[i], cell.getNumericCellValue());
					}
					break;
				default:
					map.put(columns[i], "");
					break;
				}
			}
			
		}
		return map;
		
	}
	

}
