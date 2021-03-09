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

import com.kh.drommetur.place.model.service.PlaceServiceImpl;
import com.kh.drommetur.place.model.vo.Place;

public class FoodInsert {

	  public static void main(String[] args) throws IOException {
		  
		  
		  String key="BGyVKcbfbNUJD9xPeChK16HtZdze8iJmLeo3VwSEnmS%2BoCkHPyBmNB8sUKxzwHaagddZ4XxHOU5%2Baoaf%2BXh7JA%3D%3D";
		  String contentTypeId="39";
		  
		  String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		 
		  ArrayList<Place> list=new ArrayList<Place>();
		  
		  
		  //1~7페이지

		  
			  addr+="?"+URLEncoder.encode("ServiceKey","UTF-8")+"="+key;
			  addr+="&"+URLEncoder.encode("contentTypeId","UTF-8")+"="+contentTypeId;
			  addr+="&"+URLEncoder.encode("numOfRows","UTF-8")+"="+1000;
			  addr+="&"+URLEncoder.encode("pageNo","UTF-8")+"="+7;
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
					p.setPlaceGroup("음식점");
				
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
					
					case "A05020100" :
						p.setPlaceCategory("한식");
						break;
						
					case "A05020200" :
						p.setPlaceCategory("서양식");
						break;
	
					case "A05020300" :
						p.setPlaceCategory("일식");
						break;
						
					case "A05020400" :
						p.setPlaceCategory("중식");
						break;
						
					case "A05020500" :
						p.setPlaceCategory("아시아식");
						break;
						
					case "A05020600" :
						p.setPlaceCategory("패밀리레스토랑");
						break;
						
					case "A05020700" :
						p.setPlaceCategory("이색음식점");
						break;
					
					case "A05020800" :
						p.setPlaceCategory("채식전문점");
						break;	
					case "A05020900" :
						p.setPlaceCategory("바/카페");
						break;	
					case "A05021000" :
						p.setPlaceCategory("클럽");
						break;
						
					
						
					default : 
						p.setPlaceCategory("음식점");
					
					}
					
					p.setPlaceUrl((String)place.get("firstimage"));
					list.add(p);
					
				}
				
				
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 	  
		  
//		  for(Place p : list) {
//			  System.out.println(p);		  
//			  
//		  }
		  
		  
		  
		  int insertResult =new PlaceServiceImpl().insertPlaceList(list);
		  
		 System.out.println(insertResult); 
	  }
}
