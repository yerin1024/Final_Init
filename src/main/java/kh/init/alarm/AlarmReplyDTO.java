package kh.init.alarm;

import java.sql.Timestamp;

public class AlarmReplyDTO {
	private int alarm_seq;
	private String type;
	private int applied_seq;
	private Timestamp reg_date;
	private String alarm_check;
	private String email;
	private String nickname;
	
	public AlarmReplyDTO() {}
	public AlarmReplyDTO(int alarm_seq, String type, int applied_seq, Timestamp reg_date, String alarm_check,
			String email, String nickname) {
		super();
		this.alarm_seq = alarm_seq;
		this.type = type;
		this.applied_seq = applied_seq;
		this.reg_date = reg_date;
		this.alarm_check = alarm_check;
		this.email = email;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
