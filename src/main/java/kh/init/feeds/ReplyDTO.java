package kh.init.feeds;

import java.sql.Timestamp;

public class ReplyDTO {
	private int feed_seq;
	private int reply_seq;
	private String nickname;
	private String contents;
	private Timestamp write_date;
	
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int feed_seq, int reply_seq, String nickname, String contents, Timestamp write_date) {
		super();
		this.feed_seq = feed_seq;
		this.reply_seq = reply_seq;
		this.nickname = nickname;
		this.contents = contents;
		this.write_date = write_date;
	}
	public int getFeed_seq() {
		return feed_seq;
	}
	public void setFeed_seq(int feed_seq) {
		this.feed_seq = feed_seq;
	}
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	
}
