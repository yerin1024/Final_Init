package kh.init.alarm;

import java.sql.Timestamp;

public class AlarmDTO {
	private int alarm_seq;
	private String type;
	private int applied_seq;
	private Timestamp reg_date;
	
	public AlarmDTO() {}
	public AlarmDTO(int alarm_seq, String type, int applied_seq, Timestamp reg_date) {
		super();
		this.alarm_seq = alarm_seq;
		this.type = type;
		this.applied_seq = applied_seq;
		this.reg_date = reg_date;
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

}
