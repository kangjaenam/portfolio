package poly.dto;

public class UserInfoDTO {

	private String user_email;		//이메일
	private String user_password;	//비밀번호
	private String user_author;		//권한
	private String ss_email;		//세션 이메일
	private String user_seq_no;		//유저번호
	private String user_ig;			//유저 재료
	
	public String getUser_ig() {
		return user_ig;
	}
	public void setUser_ig(String user_ig) {
		this.user_ig = user_ig;
	}
	public String getUser_seq_no() {
		return user_seq_no;
	}
	public void setUser_seq_no(String user_seq_no) {
		this.user_seq_no = user_seq_no;
	}
	public String getSs_email() {
		return ss_email;
	}
	public void setSs_email(String ss_email) {
		this.ss_email = ss_email;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_author() {
		return user_author;
	}
	public void setUser_author(String user_author) {
		this.user_author = user_author;
	}
	
	
}
