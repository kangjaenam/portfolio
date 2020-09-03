package poly.dto;

public class NoticeDTO {

	private String reg_nick; 	//글 작성자(공통)
	private String title;		//제목,관광지명(공통)
	private String title2;		//예비 제목,관광지명 
	private String searchtitle; //검색용 관광지명(공백없음)
	private String notice_no;	//글 번호(공통)
	private String viewcount;	//조회수(공통)
	private String content;		//내용(공통)
	private String reg_date;	//작성 날짜
	private String starCount;	//리뷰 별점
	
	private String tour_no;		//관광지 번호
	private String review_no;	//리뷰 번호
	private String user_no;		//회원 번호

	private String type;		//유형(관광지)
	private String addr;		//주소(관광지)
	private String lat;			//위도(관광지)
	private String har;			//경도(관광지)
	private String tel;			//전화번호(관광지)
	private String explain;  	//설명(관광지)
	private String time;		//운영시간(관광지)
	
	private String filePath;		//관광지 사진 경로
	private String fileName;		//관광지 사진 이름
	
	int startNum;
	int endNum;
	
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getSearchtitle() {
		return searchtitle;
	}
	public void setSearchtitle(String searchtitle) {
		this.searchtitle = searchtitle;
	}
	public String getStarCount() {
		return starCount;
	}
	public void setStarCount(String starCount) {
		this.starCount = starCount;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getTour_no() {
		return tour_no;
	}
	public void setTour_no(String tour_no) {
		this.tour_no = tour_no;
	}
	public String getReview_no() {
		return review_no;
	}
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getHar() {
		return har;
	}
	public void setHar(String har) {
		this.har = har;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getReg_nick() {
		return reg_nick;
	}
	public void setReg_nick(String reg_nick) {
		this.reg_nick = reg_nick;
	}
	public String getViewcount() {
		return viewcount;
	}
	public void setViewcount(String viewcount) {
		this.viewcount = viewcount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	
	
}
