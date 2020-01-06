package kh.init.friends;

public class FriendDTO {
	private String my_id;
	private String fr_id;
	private String relation;

	public FriendDTO(){
		super();
	}
	public FriendDTO(String my_id, String fr_id, String relation) {

		this.my_id = my_id;
		this.fr_id = fr_id;
		this.relation = relation;
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
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}


}