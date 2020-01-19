package kh.init.admin;

import java.sql.Timestamp;

public class DeclareDTO {
	private int feed_seq;
	private String to_id;
	private String declare_reason;
	private String from_id;
	private Timestamp declare_date;
	private String delete_feed;
	public DeclareDTO() {}
	
	@Override
	public String toString() {
		return "DeclareDTO [feed_seq=" + feed_seq + ", to_id=" + to_id + ", declare_reason=" + declare_reason
				+ ", from_id=" + from_id + ", declare_date=" + declare_date + ", delete_feed=" + delete_feed + "]";
	}

	public DeclareDTO(int feed_seq, String to_id, String declare_reason, String from_id, Timestamp declare_date,
			String delete_feed) {
		super();
		this.feed_seq = feed_seq;
		this.to_id = to_id;
		this.declare_reason = declare_reason;
		this.from_id = from_id;
		this.declare_date = declare_date;
		this.delete_feed = delete_feed;
	}
	public int getFeed_seq() {
		return feed_seq;
	}
	public void setFeed_seq(int feed_seq) {
		this.feed_seq = feed_seq;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getDeclare_reason() {
		return declare_reason;
	}
	public void setDeclare_reason(String declare_reason) {
		this.declare_reason = declare_reason;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public Timestamp getDeclare_date() {
		return declare_date;
	}
	public void setDeclare_date(Timestamp declare_date) {
		this.declare_date = declare_date;
	}
	public String getDelete_feed() {
		return delete_feed;
	}
	public void setDelete_feed(String delete_feed) {
		this.delete_feed = delete_feed;
	}
	
}
