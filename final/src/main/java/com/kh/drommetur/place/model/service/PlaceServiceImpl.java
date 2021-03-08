package com.kh.drommetur.place.model.service;

import static com.kh.drommetur.common.JDBCTemplate.getConnection;

import static com.kh.drommetur.common.JDBCTemplate.rollback;
import static com.kh.drommetur.common.JDBCTemplate.commit;
import static com.kh.drommetur.common.JDBCTemplate.close;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.drommetur.place.model.dao.PlaceDao;
import com.kh.drommetur.place.model.vo.Place;

public class PlaceServiceImpl implements PlaceService {

	
	
	

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
	


}
