package kh.init.members;

public class BlockDTO {
 private String from_id;
 private String to_id;

 public BlockDTO() {super();}
 public BlockDTO(String from_id, String to_id) {
	
	this.from_id = from_id;
	this.to_id = to_id;
	
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

 
 
}
