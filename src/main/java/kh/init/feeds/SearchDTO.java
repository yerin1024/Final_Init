package kh.init.feeds;

public class SearchDTO {
	private int page;
	private int startNum;
	private int endNum;
	
	public SearchDTO() {}
	public SearchDTO(int page, int startNum, int endNum) {
		super();
		this.page = page;
		this.startNum = startNum;
		this.endNum = endNum;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
}
