package study.jsp.helper;

import java.util.Properties;


public class TextConverter {
	// ----------- 싱글톤 객체 생성 시작 ----------
	private static TextConverter current = null;

	public static TextConverter getInstance() {
		if (current == null) {
			current = new TextConverter();
		}
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private TextConverter() {
		super();
	}
	// ----------- 싱글톤 객체 생성 끝 ----------

	
	
	public String genreOrDayConverter(String msg){
		String result="";
		
		if(msg.equals("Romance")){
			result="로맨스";
		}else if(msg.equals("Fantasy")){
			result="판타지";
		}else if(msg.equals("SF&Fantasy")){
			result="SF&판타지";
		}else if(msg.equals("Heroism")){
			result="무협";
		}else if(msg.equals("Mistery")){
			result="미스테리";
		}else if(msg.equals("Fusion")){
			result="퓨전";
		}else if(msg.equals("MON")){
			result = "월요일";
		}else if(msg.equals("TUE")){
			result = "화요일";
		}else if(msg.equals("WEN")){
			result = "수요일";
		}else if("THU".equals("")){
			result = "목요일";
		}else if(msg.equals("FRI")){
			result = "금요일";
		}else if(msg.equals("SAT")){
			result = "토요일";
		}else if(msg.equals("SUN")){
			result = "일요일";
		}
		
		
		
		return result;
	}
	
}
