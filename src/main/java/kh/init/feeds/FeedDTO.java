package kh.init.feeds;

import java.security.Timestamp;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class FeedDTO {
    private int feed_seq;
    private String email;
    private String nickname;
    private String title;
    private String contents;
    private String relation;
    private Timestamp write_date;
    
	@Override
	public String toString() {
		return "FeedDTO [feed_seq=" + feed_seq + ", email=" + email + ", nickname=" + nickname + ", title=" + title
				+ ", contents=" + contents + ", relation=" + relation + ", write_date=" + write_date + "]";
	}

	public FeedDTO() {}
	public FeedDTO(int feed_seq, String email, String nickname, String title, String contents, String relation,
			Timestamp write_date) {
		super();
		this.feed_seq = feed_seq;
		this.email = email;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.relation = relation;
		this.write_date = write_date;
	}

	public int getFeed_seq() {
		return feed_seq;
	}

	public void setFeed_seq(int feed_seq) {
		this.feed_seq = feed_seq;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
 
}