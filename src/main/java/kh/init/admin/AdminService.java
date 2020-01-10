package kh.init.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.configuration.Configuration;
import kh.init.configuration.Utils;
import kh.init.feeds.FeedDTO;
import kh.init.members.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adao;

	public List<MemberDTO> memberList() throws Exception{
		return adao.memberList();
	}
	public List<MemberDTO> blackList() throws Exception{
		return adao.blackList();
	}
	public int toBlack(String email) throws Exception{
		return adao.toBlack(email);
	}
	public int withdrawal(String email) throws Exception{
		return adao.withdrawal(email);
	}
	public int toMember(String email) throws Exception{
		return adao.toMember(email);
	}
	public List<MemberDTO> search(String searchTag, String search) throws Exception{
		return adao.search(searchTag, search);
	}
	public List<MemberDTO> searchForBlack(String searchTag, String search) throws Exception{
		return adao.searchForBlack(searchTag, search);
	}
	//member paging
	@Transactional("txManager")
	public String getPageNavi(int currentPage) throws Exception{ 
		int recordTotalCount = adao.recordTotal();
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:memberList.do?page="+currentPage;
		}

		int startNavi = 0;
		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1;
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		System.out.println("현재 페이지 번호 : "+currentPage);
		System.out.println("네비게이터시작번호 : "+startNavi);
		System.out.println("네비게이터끝번호 : "+endNavi);

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='memberList.do?page="+ (startNavi-1) +"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			System.out.println("i:" + i);
			sb.append("<a href='memberList.do?page="+i+"' id="+ i +">"); 
			sb.append(i + " "); 
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='memberList.do?page="+ (endNavi+1) +"'> > </a>"); 
		return sb.toString();
	}
	public List<MemberDTO> selectByPage(int start, int end) throws Exception{
		return adao.selectByPage(start,end);
	}
	//검색했을 때 member페이징
	@Transactional("txManager")
	public String getPageNaviSearch(int currentPage,String searchTag, String search) throws Exception{ 
		int recordTotalCount = adao.recordSearchForMember(searchTag, search);
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:search.do?page="+currentPage+"&searchTag="+searchTag+"&search="+search;
		}

		int startNavi = 0;

		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1; //딱 떨어지는 숫자면 오동작 ->1을 빼면 동작
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='search.do?page="+ (startNavi-1) +"&searchTag="+searchTag+"&search="+search+"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='search.do?page="+i+"&searchTag="+searchTag+"&search="+search+"'>"); 
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='search.do?page="+ (endNavi+1) +"&searchTag="+searchTag+"&search="+search +"'> > </a>"); 
		return sb.toString();
	}
	public List<MemberDTO> searchForMemberPaging(String searchTag, String search, int start, int end) throws Exception{
		return adao.searchForMemberPaging(searchTag, search, start, end);
	}
	//black paging
	@Transactional("txManager")
	public String getPageNaviBlack(int currentPage) throws Exception{ 
		int recordTotalCount = adao.recordBlack();
		System.out.println(recordTotalCount);
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:blackList.do?page="+currentPage;
		}

		int startNavi = 0;

		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1; 
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='blackList.do?cpage="+ (startNavi-1) +"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='blackList.do?page="+i+"'>"); 
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='blackList.do?cpage="+ (endNavi+1) +"'> > </a>"); 
		return sb.toString();
	}
	public List<MemberDTO> selectBlackByPage(int start, int end) throws Exception{
		return adao.selectBlackByPage(start,end);
	}
	//검색했을 때 black페이징
	@Transactional("txManager")
	public String getPageNaviSearchBlack(int currentPage,String searchTag, String search) throws Exception{ 
		int recordTotalCount = adao.recordSearchForBlack(searchTag, search);
		System.out.println(recordTotalCount);
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:searchForBlack.do?page="+currentPage+"&searchTag="+searchTag+"&search="+search;
		}

		int startNavi = 0;

		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1; 
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='searchForBlack.do?page="+ (startNavi-1) +"&searchTag="+searchTag+"&search="+search +"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='searchForBlack.do?page="+i+"&searchTag="+searchTag+"&search="+search+"'>"); 
			sb.append(i + " "); 
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='searchForBlack.do?page="+ (endNavi+1) +"&searchTag="+searchTag+"&search="+search +"'> > </a>"); 
		return sb.toString();
	}
	public List<MemberDTO> searchForBlackPaging(String searchTag, String search, int start, int end) throws Exception{
		return adao.searchForBlackPaging(searchTag, search, start, end);
	}
	//피드관리
	public List<FeedDTO> totalFeedList() throws Exception{
		return adao.totalFeedList();
	}
	public int deleteFeed(int feed_seq) throws Exception{
		return adao.deleteFeed(feed_seq);
	}
	//피드페이징
	@Transactional("txManager")
	public String getPageNaviFeed(int currentPage) throws Exception{  
		int recordTotalCount = adao.recordFeed();
		System.out.println(recordTotalCount);
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:totalFeedList.do?page="+currentPage;
		}

		int startNavi = 0;

		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1; 
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='totalFeedList.do?page="+ (startNavi-1) +"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='totalFeedList.do?page="+i+"'>"); 
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='totalFeedList.do?page="+ (endNavi+1) +"'> > </a>"); 
		return sb.toString();
	}
	public List<FeedDTO> selectFeedByPage(int start, int end) throws Exception{
		return adao.selectFeedByPage(start,end);
	}
	//피드페이징(검색기능)
	@Transactional("txManager")
	public String getPageNaviSearchFeed(int currentPage,String searchTag, String search) throws Exception{ 
		int recordTotalCount = adao.recordSearchForFeed(searchTag, search);
		int pageTotalCount  = 0;
		if(recordTotalCount % Utils.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount /  Utils.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
			return "redirect:searchForFeed.do?page="+currentPage+"&searchTag="+searchTag+"&search="+search;
		}

		int startNavi = 0;

		startNavi = (( currentPage - 1 )/  Utils.naviCountPerPage) *  Utils.naviCountPerPage + 1;
		int endNavi = startNavi+( Utils.naviCountPerPage-1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1 ) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); 
		if(needPrev)sb.append("<a href='searchForFeed.do?page="+ (startNavi-1) +"&searchTag="+searchTag+"&search="+search +"'> < </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='searchForFeed.do?page="+i+"&searchTag="+searchTag+"&search="+search+"'>"); 
			sb.append(i + " "); 
			sb.append("</a>");
		}
		if(needNext)sb.append("<a href='searchForFeed.do?page="+ (endNavi+1) +"&searchTag="+searchTag+"&search="+search +"'> > </a>"); 
		return sb.toString();
	}
	public List<FeedDTO> searchForFeedPaging(String searchTag, String search, int start, int end) throws Exception{
		return adao.searchForFeedPaging(searchTag, search, start, end);
	}

}
