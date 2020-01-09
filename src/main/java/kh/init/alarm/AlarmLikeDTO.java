package kh.init.alarm;

import java.sql.Timestamp;

public class AlarmLikeDTO {
	private int alarm_seq;
	private String type;
	private int applied_seq;
	private Timestamp reg_date;
	private String alarm_check;
	private String email;
	private int like_seq;
	private int feed_seq;
	private String nickname;
	
	public AlarmLikeDTO() {}
	public AlarmLikeDTO(int alarm_seq, String type, int applied_seq, Timestamp reg_date, String alarm_check,
			String email, int like_seq, int feed_seq, String nickname) {
		super();
		this.alarm_seq = alarm_seq;
		this.type = type;
		this.applied_seq = applied_seq;
		this.reg_date = reg_date;
		this.alarm_check = alarm_check;
		this.email = email;
		this.like_seq = like_seq;
		this.feed_seq = feed_seq;
		this.nickname = nickname;
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
	public int getLike_seq() {
		return like_seq;
	}
	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}
	public int getFeed_seq() {
		return feed_seq;
	}
	public void setFeed_seq(int feed_seq) {
		this.feed_seq = feed_seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
