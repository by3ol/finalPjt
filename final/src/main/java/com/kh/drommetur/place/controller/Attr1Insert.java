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

public class Attr1Insert {

	  /**
	 * @param args
	 * @throws IOException
	 */
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		  
		  
		  String key="BGyVKcbfbNUJD9xPeChK16HtZdze8iJmLeo3VwSEnmS%2BoCkHPyBmNB8sUKxzwHaagddZ4XxHOU5%2Baoaf%2BXh7JA%3D%3D";
		  String contentTypeId="12";
		  
		  String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		 
		  ArrayList<Place> list=new ArrayList<Place>();
		  
		  
		  //1~10페이지

		  
			  addr+="?"+URLEncoder.encode("ServiceKey","UTF-8")+"="+key;
			  addr+="&"+URLEncoder.encode("contentTypeId","UTF-8")+"="+contentTypeId;
			  addr+="&"+URLEncoder.encode("numOfRows","UTF-8")+"="+1000;
			  addr+="&"+URLEncoder.encode("pageNo","UTF-8")+"="+10;
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
					p.setPlaceGroup("관광지");
				
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
					
					/////////////////////////////////A01
					case "A01010100" :
						p.setPlaceCategory("국립공원");
						break;
						
					case "A01010200" :
						p.setPlaceCategory("도립공원");
						break;
	
					case "A01010300" :
						p.setPlaceCategory("군립공원");
						break;
						
					case "A01010400" :
						p.setPlaceCategory("산");
						break;
						
					case "A01010500" :
						p.setPlaceCategory("자연생태관광지");
						break;
						
					case "A01010600" :
						p.setPlaceCategory("자연휴양림");
						break;
						
					case "A01010700" :
						p.setPlaceCategory("수목원");
						break;
					
					case "A01010800" :
						p.setPlaceCategory("폭포");
						break;	
					case "A01010900" :
						p.setPlaceCategory("계곡");
						break;	
					case "A01011000" :
						p.setPlaceCategory("약수터");
						break;
						
					case "A01011100" :
						p.setPlaceCategory("해안절경");
						break;
						
					case "A01011200" :
						p.setPlaceCategory("해수욕장");
						break;
	
					case "A01011300" :
						p.setPlaceCategory("섬");
						break;
						
					case "A01011400" :
						p.setPlaceCategory("항구/포구");
						break;
						
					case "A01011500" :
						p.setPlaceCategory("어촌");
						break;
						
					case "A01011600" :
						p.setPlaceCategory("등대");
						break;
						
					case "A01011700" :
						p.setPlaceCategory("호수");
						break;
					
					case "A01011800" :
						p.setPlaceCategory("강");
						break;	
					case "A01011900" :
						p.setPlaceCategory("동굴");
						break;	
					case "A01020100" :
						p.setPlaceCategory("희귀동.식물");
						break;
						
					case "A01020200" :
						p.setPlaceCategory("기암괴석");
						break;
						
					//////////////////////A0201
					
					case "A02010100" :
						p.setPlaceCategory("고궁");
						break;
						
					case "A02010200" :
						p.setPlaceCategory("성");
						break;
	
					case "A02010300" :
						p.setPlaceCategory("문");
						break;
						
					case "A02010400" :
						p.setPlaceCategory("고택");
						break;
						
					case "A02010500" :
						p.setPlaceCategory("생가");
						break;
						
					case "A02010600" :
						p.setPlaceCategory("민속마을");
						break;
						
					case "A02010700" :
						p.setPlaceCategory("유적지/사적지");
						break;
					
					case "A02010800" :
						p.setPlaceCategory("사찰");
						break;	
					case "A02010900" :
						p.setPlaceCategory("종교성지");
						break;	
					case "A02011000" :
						p.setPlaceCategory("안보관광");
						break;
					////////////////////////////A0202
						
					case "A02020100" :
						p.setPlaceCategory("유원지");
						break;
						
					case "A02020200" :
						p.setPlaceCategory("관광단지");
						break;
	
					case "A02020300" :
						p.setPlaceCategory("온천/욕장/스파");
						break;
						
					case "A02020400" :
						p.setPlaceCategory("이색찜질방");
						break;
						
					case "A02020500" :
						p.setPlaceCategory("헬스투어");
						break;
						
					case "A02020600" :
						p.setPlaceCategory("테마공원");
						break;
						
					case "A02020700" :
						p.setPlaceCategory("공원");
						break;
					
					case "A02020800" :
						p.setPlaceCategory("유람선/잠수함관광");
						break;		
					
						////////////////////////////A0203
					
					case "A02030100" :
						p.setPlaceCategory("농.산.어촌 체험");
						break;
						
					case "A02030200" :
						p.setPlaceCategory("전통체험");
						break;
	
					case "A02030300" :
						p.setPlaceCategory("산사체험");
						break;
						
					case "A02030400" :
						p.setPlaceCategory("이색체험");
						break;
						
					case "A02030500" :
						p.setPlaceCategory("관광농원");
						break;
						
					case "A02030600" :
						p.setPlaceCategory("이색거리");
						break;
						
					////////////////////////////A0204
					
					case "A02040100" :
						p.setPlaceCategory("제철소");
						break;
						
					case "A02040200" :
						p.setPlaceCategory("조선소");
						break;
	
					case "A02040300" :
						p.setPlaceCategory("공단");
						break;
						
					case "A02040400" :
						p.setPlaceCategory("발전소");
						break;
						
					case "A02040500" :
						p.setPlaceCategory("광산");
						break;
						
					case "A02040600" :
						p.setPlaceCategory("식음료");
						break;
						
					case "A02040700" :
						p.setPlaceCategory("화학/금속");
						break;
					
					case "A02040800" :
						p.setPlaceCategory("기타");
						break;	
					case "A02040900" :
						p.setPlaceCategory("전자/반도체");
						break;	
					case "A02041000" :
						p.setPlaceCategory("자동차");
						break;
					
						////////////////////////////A0205
						
						case "A02050100" :
							p.setPlaceCategory("다리/대교");
							break;
							
						case "A02050200" :
							p.setPlaceCategory("기념탑/기념비/전망대");
							break;
		
						case "A02050300" :
							p.setPlaceCategory("분수");
							break;
							
						case "A02050400" :
							p.setPlaceCategory("동상");
							break;
							
						case "A02050500" :
							p.setPlaceCategory("터널");
							break;
							
						case "A02050600" :
							p.setPlaceCategory("유명건물");
							break;
					
					
						
							
					
					default : 
						p.setPlaceCategory("관광지");
					
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
