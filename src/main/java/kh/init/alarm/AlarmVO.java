package kh.init.alarm;

import java.sql.Timestamp;

public class AlarmVO {
	private int alarm_seq;
	private String type;
	private int applied_seq;
	private Timestamp reg_date;
	private String reg_date_edit;
	private String alarm_check;
	private String email;
	
	private int replyfeed;
	private int reply_seq;
	private String replyer;
	private String contents;
	
	private int like_seq;
	private int likefeed;
	private String liker;
	
	private String fr_requester;
	
	private String member_email;
	private String nickname;
	private String profile_img;

	public AlarmVO() {}
	public AlarmVO(int alarm_seq, String type, int applied_seq, Timestamp reg_date, String reg_date_edit,
			String alarm_check, String email, int replyfeed, int reply_seq, String replyer, String contents,
			int like_seq, int likefeed, String liker, String fr_requester, String member_email, String nickname,
			String profile_img) {
		super();
		this.alarm_seq = alarm_seq;
		this.type = type;
		this.applied_seq = applied_seq;
		this.reg_date = reg_date;
		this.reg_date_edit = reg_date_edit;
		this.alarm_check = alarm_check;
		this.email = email;
		this.replyfeed = replyfeed;
		this.reply_seq = reply_seq;
		this.replyer = replyer;
		this.contents = contents;
		this.like_seq = like_seq;
		this.likefeed = likefeed;
		this.liker = liker;
		this.fr_requester = fr_requester;
		this.member_email = member_email;
		this.nickname = nickname;
		this.profile_img = profile_img;
	}

	public int getAlarm_seq() {
		return alarm_seq;
	}

	public void setAlarm_seq(int alarm_seq) {
		this.alarm_seq = alarm_seq;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getApplied_seq() {
		return applied_seq;
	}

	public void setApplied_seq(int applied_seq) {
		this.applied_seq = applied_seq;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getReg_date_edit() {
		return reg_date_edit;
	}
	public void setReg_date_edit(String reg_date_edit) {
		this.reg_date_edit = reg_date_edit;
	}
	public String getAlarm_check() {
		return alarm_check;
	}

	public void setAlarm_check(String alarm_check) {
		this.alarm_check = alarm_check;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReplyfeed() {
		return replyfeed;
	}

	public void setReplyfeed(int replyfeed) {
		this.replyfeed = replyfeed;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}

	public int getLikefeed() {
		return likefeed;
	}

	public void setLikefeed(int likefeed) {
		this.likefeed = likefeed;
	}

	public String getLiker() {
		return liker;
	}

	public void setLiker(String liker) {
		this.liker = liker;
	}

	public String getFr_requester() {
		return fr_requester;
	}

	public void setFr_requester(String fr_requester) {
		this.fr_requester = fr_requester;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
}
