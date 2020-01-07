package kh.init.friends;

public class FriendRequestDTO {
	private int friend_seq;
	private String from_id;
	private String to_id;
	private String relation;

	public FriendRequestDTO() {super();}
	public FriendRequestDTO(int friend_seq, String from_id, String to_id, String relation) {

		this.friend_seq = friend_seq;
		this.from_id = from_id;
		this.to_id = to_id;
		this.relation = relation;
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
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}


}

