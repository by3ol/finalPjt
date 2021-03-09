package com.kh.drommetur.place.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kh.drommetur.place.model.service.PlaceService;
import com.kh.drommetur.place.model.service.PlaceServiceImpl;
import com.kh.drommetur.place.model.vo.Place;



public class HotelInsert {

		
	
	  public static void main(String[] args) throws IOException {
		  
		  
		  String key="BGyVKcbfbNUJD9xPeChK16HtZdze8iJmLeo3VwSEnmS%2BoCkHPyBmNB8sUKxzwHaagddZ4XxHOU5%2Baoaf%2BXh7JA%3D%3D";
		  String contentTypeId="32";
		  
		  String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		 
		  ArrayList<Place> list=new ArrayList<Place>();
		  
		  
		  
		  	//페이지 1~4 
		  
			  addr+="?"+URLEncoder.encode("ServiceKey","UTF-8")+"="+key;
			  addr+="&"+URLEncoder.encode("contentTypeId","UTF-8")+"="+contentTypeId;
			  addr+="&"+URLEncoder.encode("numOfRows","UTF-8")+"="+1000;
			  addr+="&"+URLEncoder.encode("pageNo","UTF-8")+"="+4;
			  addr+="&"+URLEncoder.encode("MobileOS","UTF-8")+"=ETC";
			  addr+="&"+URLEncoder.encode("MobileApp","UTF-8")+"=drommetur";
			  addr+="&"+URLEncoder.encode("_type","UTF-8")+"=json";
			  
			  
			  
			  
			  System.out.println(addr);
			  URL url=new URL(addr);
			  
			 String result="";
			  
			 try( BufferedReader br=new BufferedReader(new InputStreamReader(url.openStream()))){
			  
			  
				  String line="";
				  
				  while((line=br.readLine())!=null) {
					  
					  result=result.concat(line);
					  
				  }
			  
			 }catch (Exception e) {
				
				 // TODO: handle exception
				 e.printStackTrace();
			}
			  
			 //System.out.println(result);
			 
			  JSONParser parser=new JSONParser();
			  
			  try {
				JSONObject obj=(JSONObject)parser.parse(result);
				
				JSONObject response=(JSONObject)obj.get("response"); //response가져오기 
				
				JSONObject body=(JSONObject)response.get("body"); //body가져오기 
				
				JSONObject items=(JSONObject)body.get("items"); //items가져오기 
				
				JSONArray item=(JSONArray)items.get("item"); //item가져오기 
				
				
				System.out.println("item 길이 : "+item.size());
				
				JSONObject place;
				
				for(int i=0;i<item.size();i++) {
					
					Place p=new Place();
					place=(JSONObject)item.get(i);
					
					if((place.get("mapx")==null) || (place.get("mapy")==null || place.get("areacode")==null)) {
						continue;
					}
					
					p.setPlaceAddr((String)place.get("addr1"));
					p.setPlaceGroup("숙박");
				
					if(place.get("mapx") instanceof Double) {
						p.setPlaceLon((Double)place.get("mapx"));
					}else {
						p.setPlaceLon(Double.parseDouble((String)place.get("mapx")));
						
					}
					
					
					if(place.get("mapy") instanceof Double) {
						
						p.setPlaceLat((Double)place.get("mapy"));
					}else {
						p.setPlaceLat(Double.parseDouble((String)place.get("mapy")));
						
					}
					
					
					
					
					p.setRegionNo(Integer.parseInt(String.valueOf((Long)place.get("areacode"))));
					p.setPlacePhone((String)place.get("tel"));
					p.setPlaceName((String)place.get("title"));
					
					switch((String)place.get("cat3")) {
					
					case "B02010100" :
						p.setPlaceCategory("관광호텔");
						break;
						
					case "B02010200" :
						p.setPlaceCategory("수상관광호텔");
						break;
	
					case "B02010300" :
						p.setPlaceCategory("전통호텔");
						break;
						
					case "B02010400" :
						p.setPlaceCategory("가족호텔");
						break;
						
					case "B02010500" :
						p.setPlaceCategory("콘도미니엄");
						break;
						
					case "B02010600" :
						p.setPlaceCategory("유스호스텔");
						break;
						
					case "B02010700" :
						p.setPlaceCategory("펜션");
						break;
					
					case "B02010800" :
						p.setPlaceCategory("여관");
						break;	
					case "B02010900" :
						p.setPlaceCategory("모텔");
						break;	
					case "B02011000" :
						p.setPlaceCategory("민박");
						break;
						
					case "B02011100" :
						p.setPlaceCategory("게스트하우스");
						break;
						
					case "B02011200" :
						p.setPlaceCategory("홈스테이");
						break;
					
					case "B02011300" :
						p.setPlaceCategory("서비스드레지던스");
						break;	
					case "B02011400" :
						p.setPlaceCategory("의료관광호텔");
						break;
						
					case "B02011500" :
						p.setPlaceCategory("소형호텔");
						break;		
					case "B02011600" :
						p.setPlaceCategory("한옥스테이");
						break;							
						
					
					
					}
					
					p.setPlaceUrl((String)place.get("firstimage"));
					
					list.add(p);
					
				}
				
				
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 	  
//		  
//		  for(Place p : list) {
//			  System.out.println(p);		  
//			  
//		  }
		  
		  
		  
		  int insertResult =new PlaceServiceImpl().insertPlaceList(list);
		  
		 System.out.println(insertResult); 
	  }
}
