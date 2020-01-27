package kh.init.messages;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageDTO {
	private int msg_seq;
	private String from_id;
	private String to_id;
	private String contents;
	private Timestamp write_date;
	private String receive_read;
	private int unread_count;
	
//	join 시 필요한 항목
	private String my_id;
	private String fr_id;
	private String nickname;
	private String profile_img;
	private String email;
	private String formed_date;
	
	public MessageDTO() {}
	public MessageDTO(int msg_seq, String from_id, String to_id, String contents, Timestamp write_date,
			String receive_read, int unread_count, String my_id, String fr_id, String nickname, String profile_img,
			String email, String formed_date) {
		super();
		this.msg_seq = msg_seq;
		this.from_id = from_id;
		this.to_id = to_id;
		this.contents = contents;
		this.write_date = write_date;
		this.receive_read = receive_read;
		this.unread_count = unread_count;
		this.my_id = my_id;
		this.fr_id = fr_id;
		this.nickname = nickname;
		this.profile_img = profile_img;
		this.email = email;
		this.formed_date = formed_date;
	}

	public int getMsg_seq() {
		return msg_seq;
	}

	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
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

	public String getReceive_read() {
		return receive_read;
	}

	public void setReceive_read(String receive_read) {
		this.receive_read = receive_read;
	}

	public int getUnread_count() {
		return unread_count;
	}

	public void setUnread_count(int unread_count) {
		this.unread_count = unread_count;
	}

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	public String getFr_id() {
		return fr_id;
	}

	public void setFr_id(String fr_id) {
		this.fr_id = fr_id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFormed_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
		return sdf.format(this.write_date);
	}

	public void setFormed_date(String formed_date) {
		this.formed_date = formed_date;
	}
	
	
	
	
	
//	public void setFormat_date(Timestamp write_date) {
//		Timestamp ts = write_date;
//		Date date = new Date();
//		date.setTime(ts.getTime());
//		String format_date = new SimpleDateFormat("yyyyMMdd").format(date);
//		this.format_date = format_date;
//	}
//	public String getFormat_date() {
//		return format_date;
//	}
	
//	public String getFormedDate1() {
//		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
//		long write_date = this.write_date.getTime();
//		long currrent_date = System.currentTimeMillis();
//		long gapTime = (currrent_date - write_date)/1000;
//		
//		if(gapTime < 300) {
//			return "5분 이내";
//		}else if (300 <= gapTime && gapTime<=3600) {
//			return "1시간 이내";
//		}else if (3600 <= gapTime && gapTime<=86400) {
//			return "오늘";
//		}else {
//			return sdf.format(this.write_date);
//		}
//		
//	}
	
}
