package com.kh.drommetur.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {


	
	private static Connection conn=null;
	
	//DB 연결을 위하여 공용커넥션 객체를 반환해주는 메소드
	public static Connection getConnection() {
		
		if(conn==null) {
	
			
			try {
				
				//외부에서 정보를 읽어와 저장할 Properties 객체 선언 및 생성
				Properties prop=new Properties();
				
				//driver.properties파일을 읽어옴
				prop.load(new FileReader("src/main/resources/jdbc.properties"));
				
				Class.forName(prop.getProperty("jdbc.driverClassName"));
	
				//driver.properties에서 JDBC 드라이버 등록 및 DB연결작업에 필요한 값들을 
				//getProperty(String key)로 가져오기
				conn = DriverManager.getConnection(prop.getProperty("jdbc.url"),prop.getProperty("jdbc.username"),prop.getProperty("jdbc.password"));
				conn.setAutoCommit(false);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		
		try {
			if(conn !=null && !conn.isClosed()) {
				conn.close();
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	// preparedstatement는 statement의 하위 클래스이므로 재작성 안해도 됨
	public static void close(Statement stmt) {
		
		try {
			if(stmt !=null && !stmt.isClosed()) {
				stmt.close();
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public static void close(ResultSet rSet) {
		
		try {
			if(rSet !=null && !rSet.isClosed()) {
				rSet.close();
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed() ) {
				conn.commit();
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed() ) {
				conn.rollback();
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
