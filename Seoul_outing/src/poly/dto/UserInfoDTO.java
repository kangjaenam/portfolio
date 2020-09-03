package poly.dto;

public class UserInfoDTO {

	private String user_no;
	private String email;
	private String orgEmail;
	private String password;
	private String password2;
	private String nickname;
	private String orgNickname;
	private String exists_yn;
	private String nick_yn;
	private String ranpwd;
	private String authority;
	private String reg_dt;
	private String state;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getOrgNickname() {
		return orgNickname;
	}
	public void setOrgNickname(String orgNickname) {
		this.orgNickname = orgNickname;
	}
	public String getOrgEmail() {
		return orgEmail;
	}
	public void setOrgEmail(String orgEmail) {
		this.orgEmail = orgEmail;
	}
	public String getRanpwd() {
		return ranpwd;
	}
	public void setRanpwd(String ranpwd) {
		this.ranpwd = ranpwd;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getNick_yn() {
		return nick_yn;
	}
	public void setNick_yn(String nick_yn) {
		this.nick_yn = nick_yn;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getExists_yn() {
		return exists_yn;
	}
	public void setExists_yn(String exists_yn) {
		this.exists_yn = exists_yn;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	// 회원가입시, 중복가입을 방지 위해 사용할 변수
	// DB를 조회해서 회원이 존재하면 Y값을 반환함
	// DB테이블에 존재하지 않는 가상의 컬럼(ALIAS)



}
