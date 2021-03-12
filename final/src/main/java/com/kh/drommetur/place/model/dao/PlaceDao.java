package com.kh.drommetur.place.model.dao;

import static com.kh.drommetur.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.place.model.vo.Place;

@Repository
public class PlaceDao {

	public int insertPlace(Place p, Connection conn) {
		
		
		int result=0;
		
		PreparedStatement pstmt=null;
		
		String sql="INSERT INTO PLACE VALUES(SEQ_PLACE.NEXTVAL,?,?,?,?,?,?,?,SYSDATE,DEFAULT,?,?,DEFAULT,DEFAULT)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPlaceAddr());
			pstmt.setString(2, p.getPlaceName());
			pstmt.setString(3, p.getPlacePhone());
			pstmt.setString(4, p.getPlaceGroup());
			pstmt.setDouble(5, p.getPlaceLon());
			pstmt.setDouble(6, p.getPlaceLat());
			pstmt.setString(7, p.getPlaceCategory());
			pstmt.setInt(8, p.getRegionNo());
			pstmt.setString(9, p.getPlaceUrl());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, String group) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("placeMapper.selectPlaceList", group);
	}




	
	



	

}
