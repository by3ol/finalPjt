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

public class Attr2Insert {

	
	  public static void main(String[] args) throws IOException {
		  
		  
		  String key="BGyVKcbfbNUJD9xPeChK16HtZdze8iJmLeo3VwSEnmS%2BoCkHPyBmNB8sUKxzwHaagddZ4XxHOU5%2Baoaf%2BXh7JA%3D%3D";
		  String contentTypeId="28";
		  
		  String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		 
		  ArrayList<Place> list=new ArrayList<Place>();
		  
		  
		  //1~2페이지

		  
			  addr+="?"+URLEncoder.encode("ServiceKey","UTF-8")+"="+key;
			  addr+="&"+URLEncoder.encode("contentTypeId","UTF-8")+"="+contentTypeId;
			  addr+="&"+URLEncoder.encode("numOfRows","UTF-8")+"="+1000;
			  addr+="&"+URLEncoder.encode("pageNo","UTF-8")+"="+2;
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
					
					
					
					if((place.get("mapx")==null) || (place.get("mapy")==null || place.get("areacode")==null || place.get("cat3")==null)) {
						continue;
					}
					
					p.setPlaceAddr((String)place.get("addr1"));
					p.setPlaceGroup("레포츠");
				
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
					
					
					if(place.get("tel")  !=null ){
						if(place.get("tel") instanceof String) {
							p.setPlacePhone((String)place.get("tel"));
						}
						else if(place.get("tel") instanceof Long) {
							p.setPlacePhone(String.valueOf((Long)place.get("tel")));
						}
						
					}
					
					p.setPlaceName((String)place.get("title"));
					
					switch((String)place.get("cat3")) {
					
					
					/////////////////////////////////A0301
					case "A03010100" :
						p.setPlaceCategory("육상레포츠");
						break;
						
					case "A03010200" :
						p.setPlaceCategory("수상레포츠");
						break;
	
					case "A03010300" :
						p.setPlaceCategory("항공레포츠");
						break;
					
					/////////////////////////////////A0302
					case "A03020100" :
						p.setPlaceCategory("스포츠센터");
						break;
						
					case "A03020200" :
						p.setPlaceCategory("수련시설");
						break;
	
					case "A03020300" :
						p.setPlaceCategory("경기장");
						break;
						
					case "A03020400" :
						p.setPlaceCategory("인라인(실내 인라인 포함)");
						break;
						
					case "A03020500" :
						p.setPlaceCategory("자전거하이킹");
						break;
						
					case "A03020600" :
						p.setPlaceCategory("카트");
						break;
						
					case "A03020700" :
						p.setPlaceCategory("골프");
						break;
					
					case "A03020800" :
						p.setPlaceCategory("경마");
						break;	
					case "A03020900" :
						p.setPlaceCategory("경륜");
						break;	
					case "A03021000" :
						p.setPlaceCategory("카지노");
						break;
						
					case "A03021100" :
						p.setPlaceCategory("승마");
						break;
						
					case "A03021200" :
						p.setPlaceCategory("스키/스노보드");
						break;
	
					case "A03021300" :
						p.setPlaceCategory("스케이트");
						break;
						
					case "A03021400" :
						p.setPlaceCategory("썰매장");
						break;
						
					case "A03021500" :
						p.setPlaceCategory("수렵장");
						break;
						
					case "A03021600" :
						p.setPlaceCategory("사격장");
						break;
						
					case "A03021700" :
						p.setPlaceCategory("야영장,오토캠핑장");
						break;
					
					case "A03021800" :
						p.setPlaceCategory("암벽등반");
						break;	
					case "A03021900" :
						p.setPlaceCategory("빙벽등반");
						break;	
					case "A03022000" :
						p.setPlaceCategory("서바이벌게임");
						break;
						
					case "A03022100" :
						p.setPlaceCategory("ATV");
						break;
						

					case "A03022200" :
						p.setPlaceCategory("MTB");
						break;
					case "A03022300" :
						p.setPlaceCategory("오프로드");
						break;
					case "A03022400" :
						p.setPlaceCategory("번지점프");
						break;
					case "A03022500" :
						p.setPlaceCategory("자동차경주");
						break;
					case "A03022600" :
						p.setPlaceCategory("스키(보드) 렌탈샵");
						break;
					case "A03022700" :
						p.setPlaceCategory("트래킹");
						break;
						
					
					/////////////////////////////////A0303
						case "A03030100" :
							p.setPlaceCategory("윈드서핑/제트스키");
							break;
							
						case "A03030200" :
							p.setPlaceCategory("카약/카누");
							break;
		
						case "A03030300" :
							p.setPlaceCategory("요트");
							break;
							
						case "A03030400" :
							p.setPlaceCategory("스노쿨링/스킨스쿠버다이빙");
							break;
							
						case "A03030500" :
							p.setPlaceCategory("민물낚시");
							break;
							
						case "A03030600" :
							p.setPlaceCategory("바다낚시");
							break;
							
						case "A03030700" :
							p.setPlaceCategory("수영");
							break;
						
						case "A03030800" :
							p.setPlaceCategory("래프팅");
							break;	
						
							/////////////////////////////////A0304
						case "A03040100" :
							p.setPlaceCategory("스카이다이빙");
							break;
							
						case "A03040200" :
							p.setPlaceCategory("초경량비행");
							break;
		
						case "A03040300" :
							p.setPlaceCategory("헹글라이딩/패러글라이딩");
							break;
							
						case "A03040400" :
							p.setPlaceCategory("열기구");
							break;	
							

						case "A03050100" :
							p.setPlaceCategory("복합 레포츠");
							break;	
						
							
					
					default : 
						p.setPlaceCategory("레포츠");
					
					}
					
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
//		  
		  
		  
		  int insertResult =new PlaceServiceImpl().insertPlaceList(list);
		  
		 System.out.println(insertResult); 
	  }
}
