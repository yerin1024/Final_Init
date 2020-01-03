package kh.init.members;

import java.sql.Timestamp;

public class MemberDTO {
	private String email;
	private String pw;
	private String nickname;
	private String name;
	private String phone;
	private String birth;
	private String profile_img;
	private String profile_msg;
	private String admin;
	private Timestamp join_date;
	private String id_type;
	private String black;
	
	public MemberDTO() {}

	public MemberDTO(String email, String pw, String nickname, String name, String phone, String birth,
			String profile_img, String profile_msg, String admin, Timestamp join_date, String id_type, String black) {
		super();
		this.email = email;
		this.pw = pw;
		this.nickname = nickname;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.profile_img = profile_img;
		this.profile_msg = profile_msg;
		this.admin = admin;
		this.join_date = join_date;
		this.id_type = id_type;
		this.black = black;
	}
   public String getEmail() {return email;}
   public void setEmail(String email) {this.email = email;}

   public String getPw() {return pw;}
   public void setPw(String pw) {this.pw = pw;}

   public String getNickname() {return nickname;}
   public void setNickname(String nickname) {this.nickname = nickname;}

   public String getName() {return name;}
   public void setName(String name) {this.name = name;}

   public String getPhone() {return phone;}
   public void setPhone(String phone) {this.phone = phone;}

   public String getBirth() {return birth;}
   public void setBirth(String birth) {this.birth = birth;}

   public String getProfile_img() {return profile_img;}
   public void setProfile_img(String profile_img) {this.profile_img = profile_img;}

   public String getProfile_msg() {return profile_msg;}
   public void setProfile_msg(String profile_msg) {this.profile_msg = profile_msg;}

   public String getAdmin() {return admin;}
   public void setAdmin(String admin) {this.admin = admin;}

   public Timestamp getJoin_date() {return join_date;}
   public void setJoin_date(Timestamp join_date) {this.join_date = join_date;}

   public String getId_type() {return id_type;}
   public void setId_type(String id_type) {this.id_type = id_type;}

   public String getBlack() {return black;}
   public void setBlack(String black) {this.black = black;}
}
