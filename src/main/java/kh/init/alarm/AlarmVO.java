package kh.init.alarm;

import java.sql.Timestamp;

public class AlarmVO {
	private int alarm_seq;
	private String type;
	private int applied_seq;
	private Timestamp reg_date;
	private String alarm_check;
	private String email;
	
	private int feed_seq_r;
	private int reply_seq;
	private String nickname_r;
	private String contents;
	
	private int friend_seq;
	private String from_id;
	private String to_id;
	
	private int like_seq;
	private int feed_seq_l;
	private String email_lk;
	
	private String nickname_m;

	public AlarmVO() {}
	public AlarmVO(int alarm_seq, String type, int applied_seq, Timestamp reg_date, String alarm_check, String email,
			int feed_seq_r, int reply_seq, String nickname_r, String contents, int friend_seq, String from_id,
			String to_id, int like_seq, int feed_seq_l, String email_lk, String nickname_m) {
		super();
		this.alarm_seq = alarm_seq;
		this.type = type;
		this.applied_seq = applied_seq;
		this.reg_date = reg_date;
		this.alarm_check = alarm_check;
		this.email = email;
		this.feed_seq_r = feed_seq_r;
		this.reply_seq = reply_seq;
		this.nickname_r = nickname_r;
		this.contents = contents;
		this.friend_seq = friend_seq;
		this.from_id = from_id;
		this.to_id = to_id;
		this.like_seq = like_seq;
		this.feed_seq_l = feed_seq_l;
		this.email_lk = email_lk;
		this.nickname_m = nickname_m;
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
	public int getFeed_seq_r() {
		return feed_seq_r;
	}
	public void setFeed_seq_r(int feed_seq_r) {
		this.feed_seq_r = feed_seq_r;
	}
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public String getNickname_r() {
		return nickname_r;
	}
	public void setNickname_r(String nickname_r) {
		this.nickname_r = nickname_r;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getFriend_seq() {
		return friend_seq;
	}
	public void setFriend_seq(int friend_seq) {
		this.friend_seq = friend_seq;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public int getLike_seq() {
		return like_seq;
	}
	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}
	public int getFeed_seq_l() {
		return feed_seq_l;
	}
	public void setFeed_seq_l(int feed_seq_l) {
		this.feed_seq_l = feed_seq_l;
	}
	public String getEmail_lk() {
		return email_lk;
	}
	public void setEmail_lk(String email_lk) {
		this.email_lk = email_lk;
	}
	public String getNickname_m() {
		return nickname_m;
	}
	public void setNickname_m(String nickname_m) {
		this.nickname_m = nickname_m;
	}
}
