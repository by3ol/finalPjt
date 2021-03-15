package com.kh.drommetur.place.model.service;

import static com.kh.drommetur.common.JDBCTemplate.close;
import static com.kh.drommetur.common.JDBCTemplate.commit;
import static com.kh.drommetur.common.JDBCTemplate.getConnection;
import static com.kh.drommetur.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.place.model.dao.PlaceDao;
import com.kh.drommetur.place.model.vo.Place;

@Service
public class PlaceServiceImpl implements PlaceService {

	
	@Autowired
	PlaceDao placeDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertPlaceList(ArrayList<Place> list) {
		
		Connection conn=getConnection();
		int result=1;
		
		
		for(Place p : list) {
			
			 
			result*=new PlaceDao().insertPlace(p,conn);
		}
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}


	@Override
	public ArrayList<Place> selectPlaceList(Place place) {
		// TODO Auto-generated method stub
		return placeDao.selectPlaceList(sqlSession,place);
	}



	


}
