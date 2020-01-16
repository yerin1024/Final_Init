package kh.init.feeds;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.init.members.MemberDTO;
import kh.init.members.MemberService;

@RequestMapping("/feed")
@Controller
public class FeedController {

	@Autowired
	private FeedService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private HttpSession session;

	@RequestMapping("/myFeed")
	public String myFeed(String email,Model model) {
		System.out.println("myFeed 도착");
		int ipage = 1;
		List<FeedDTO> list = null;
		List<String> cover = new ArrayList<>();
		
		try {

			MemberDTO dto = mservice.getMyPageService(email);
			list = (List<FeedDTO>)service.getMyFeed(ipage, email).get("list");
			cover = (List<String>)service.getMyFeed(ipage, email).get("cover");
			System.out.println("dto 이메일값 확인 : "+dto.getEmail()+dto.getName() );
			model.addAttribute("mvo", dto);
			model.addAttribute("list", list);
			model.addAttribute("cover", cover);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "feeds/myFeed";
	}
	

	@RequestMapping(value = "/myFeedAjax", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String myFeedAjax(String page) {
		System.out.println("myFeedAjax 도착");
		int ipage = Integer.parseInt(page);
		System.out.println("ipage :  "+ipage);
		List<FeedDTO> list = new ArrayList<>();
		List<Integer> rnum = new ArrayList<>();
		List<String> cover = new ArrayList<>();
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
//			if((List<FeedDTO>)service.getMyFeed(ipage, email)==null) {
//				System.out.println("list는 null입니다.");
//				return "{\"result\" : \"false\"}";
//			}
			list = (List<FeedDTO>)service.getMyFeed(ipage, email).get("list");
			rnum = (List<Integer>)service.getMyFeed(ipage, email).get("rnum");
			cover = (List<String>)service.getMyFeed(ipage, email).get("cover");
			System.out.println("1 : "+service);
			System.out.println("2 : "+service.getMyFeed(ipage, email));
			System.out.println("3 : "+service.getMyFeed(ipage, email).get("list"));
			System.out.println("3 : "+service.getMyFeed(ipage, email).get("rnum"));
			
		}catch(Exception e) {
			return "{\"result\" : \"false\"}";
		}
		Gson g = new Gson();
		
		JsonObject obj = new JsonObject();
		obj.addProperty("list", g.toJson(list));
		obj.addProperty("rnum", g.toJson(rnum));
		obj.addProperty("cover", g.toJson(cover));
		
		return obj.toString();
	}
	
	@RequestMapping("/deleteProc")
	public String deleteProc(int feed_seq) {
		System.out.println("삭제 도착!");
		try {
			int result =  service.deleteFeed(feed_seq);
			System.out.println(result + "행이 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:myFeed";
	}

	@RequestMapping("/writeFeed")
	public String writeFeed() {
		return "feeds/writeFeed";
	}


	@RequestMapping("/writeFeedProc")
	public String writeFeedProc(FeedDTO dto) {
		System.out.println("게시물 등록 도착!");		
		dto.setEmail(((MemberDTO)session.getAttribute("loginInfo")).getEmail());
		dto.setNickname(((MemberDTO)session.getAttribute("loginInfo")).getNickname());

		int result = 0;
		//mediaTmpUpload에서 임시로 mediaTmp폴더에 넣어둔 미디어들을 옮기기 위한 폴더
		String mediaPath = session.getServletContext().getRealPath("media");
		String realPath = session.getServletContext().getRealPath("");
		
		//mediaTmpUpload에서 사진업로드 될 때마다 사진 경로+이름을 mediaList에 담아둔걸 꺼냄
		List<String> mediaList = ((ArrayList<String>)session.getAttribute("mediaList"));

		try {
			result = service.registerFeed(dto, mediaList, mediaPath, realPath);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//등록이 되면 mediaList를 비워둠
		session.setAttribute("mediaList", null);

		return "redirect:myFeed";
	}


	//writeFeed에서 dropzone을 이용해서 파일업로드를 했을 때의 ajax 통신을 위한 requestMapping
	@RequestMapping(value="/mediaTmpUpload", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String mediaTmpUpload(MultipartFile file) {
		System.out.println("mediaTmpUpload 도착");
		
		//mediaTmpUpload에서는 mediaTmp폴더에 저장해놓음 , media라는 정식폴더에 넣어주는 과정은 writeFeedProc에서 수행
		String path = session.getServletContext().getRealPath("mediaTmp");
		
		String filePath = null;
		String returnVal = null;
		if(file.getSize()>10485760) {
			returnVal = "{\"result\" : \"fail\"}";
			return returnVal;
		}

		String fileType = file.getContentType();

		fileType = fileType.split("/")[0];
		System.out.println("fileType : "+fileType);
		try {
			if(fileType.contentEquals("image")||fileType.contentEquals("video")) {
				filePath = service.mediaTmpUpload(file, path);
				System.out.println("filePath : " +filePath);
				
				//writeFeedProc에서 media들의 경로가 필요해서 session에 넣어둠 , mediaList는 임시로 homeController에서 생성함
				((ArrayList<String>)session.getAttribute("mediaList")).add(filePath);
				returnVal = "{\"result\" : \""+filePath+"\", \"type\" : \""+fileType+"\"}";
			}else {
				//파일형식이 image나 video가 아닌 경우 업로드가 되지 않도록하고 fail을 리턴해서 alert창으로 불가능한 파일이라고 띄우도록 했음
				returnVal = "{\"result\" : \"fail\"}";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return returnVal;
	}



	@RequestMapping("/wholeFeed")
	public String wholeFeed(Model model, String keyword) {
		System.out.println("wholeFeed 도착");
		System.out.println(keyword);
		int ipage = 1;
		List<FeedDTO> list = new ArrayList<>();
		List<MemberDTO> friendList = new ArrayList<>();
		List<String> cover = new ArrayList<>();
		try {
				if(keyword==null || keyword.startsWith("#")) {//전체피드 가져오기 또는 해시태그 검색
					System.out.println("해시태그검색");
					list = (List<FeedDTO>)service.wholeFeed(ipage, keyword).get("list");
					cover = (List<String>)service.wholeFeed(ipage, keyword).get("cover");
					for(int i=0; i<list.size(); i++) {
						System.out.println("list("+i+") : " +list.get(i));
						System.out.println("cover("+i+") : " +cover.get(i));
					}
					model.addAttribute("option", "nfriend");
				}else { //친구검색
					cover = null;
					System.out.println("wholeFeed controller- 친구검색");
					friendList = service.searchFriend(keyword);
					model.addAttribute("option", "friend");
				}
		}catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("list", list);
		model.addAttribute("friendList", friendList);
		model.addAttribute("cover", cover);
		return "/feeds/wholeFeed";
	}

	@RequestMapping(value = "/wholeFeedAjax", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String wholeFeedAjax(Model model, String keyword, String page) {
		System.out.println("wholeFeedAjax 도착");
		System.out.println(keyword);
		int ipage = Integer.parseInt(page);
		List<FeedDTO> list = new ArrayList<>();
		List<Integer> rnum = new ArrayList<>();
		List<MemberDTO> friendList = new ArrayList<>();
		List<String> cover = new ArrayList<>();
		
		System.out.println("rnum : "+rnum.toString());
		Gson g = new Gson();
		
		JsonObject obj = new JsonObject();
		try {
				if(keyword==null || keyword.startsWith("#")) {//전체피드 가져오기 또는 해시태그 검색
					System.out.println("해시태그검색");
					list = (List<FeedDTO>)service.wholeFeed(ipage, keyword).get("list");
					rnum = (List<Integer>)service.wholeFeed(ipage, keyword).get("rnum");
					cover = (List<String>)service.wholeFeed(ipage, keyword).get("cover");
					for(int i=0; i<list.size(); i++) {
						System.out.println("list("+i+") : " +list.get(i));
						System.out.println("rnum("+i+") : " +rnum.get(i));
						System.out.println("cover("+i+") : " +cover.get(i));
					}
					obj.addProperty("option", "nfriend");
				}else { //친구검색
					cover = null;
					friendList = service.searchFriend(keyword);
					obj.addProperty("option", "friend");
				}
				obj.addProperty("option", "nfriend");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		obj.addProperty("list", g.toJson(list));
		obj.addProperty("rnum", g.toJson(rnum));
		obj.addProperty("cover", g.toJson(cover));
		
		return obj.toString();
	}

	@RequestMapping("/scrapFeed")
	public String scrapFeed(Model model) {
		System.out.println("scrapFeed 도착");
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		System.out.println("email : "+email);

		List<String> cover = new ArrayList<>();
		List<FeedDTO> scrapList = new ArrayList<>();

		try {
			scrapList = (List<FeedDTO>)service.scrapFeed(email).get("scrapList");
			cover = (List<String>)service.scrapFeed(email).get("cover");
			System.out.println("list.size : "+scrapList.size());
			model.addAttribute("list", scrapList);
			model.addAttribute("cover", cover);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/feeds/scrapFeed";
	}



	@RequestMapping("/detailView") 
	public String detailView(int feed_seqS, Model model) {
		System.out.println("detailView 도착");
		int feed_seq = feed_seqS;
		System.out.println(feed_seq);
		int likeCheck = 0; //0은 안한것 1은 한것
		int bookmarkCheck = 0; //0은 안한것 1은 한것
		FeedDTO dto = null;
		List<ReplyDTO> parentReply = new ArrayList<>();
		List<ReplyDTO> childReply = new ArrayList<>();
		List<String> list = new ArrayList<>();
		try {
			dto = service.detailView(feed_seq);
			likeCheck = service.likeCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail());
			bookmarkCheck = service.bookmarkCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail());
			model.addAttribute("likeCheck", likeCheck);
			model.addAttribute("bookmarkCheck", bookmarkCheck);

			parentReply = (List<ReplyDTO>)service.viewAllReply(feed_seq).get("parents");
			childReply = (List<ReplyDTO>)service.viewAllReply(feed_seq).get("childs");
			
			System.out.println("controller parent댓글"+parentReply.toString());
			list = service.getMediaList(feed_seq);
			model.addAttribute("parentReply",parentReply);
			model.addAttribute("childReply",childReply);
			model.addAttribute("media", list);
			model.addAttribute("dto", dto);	
		}catch(Exception e) {
			e.printStackTrace();
		}			
		return "/feeds/detailView";
	}

	@RequestMapping("/getFriendFeed")
	public String getFriendFeed(Model model, String page) {
		
		int ipage = 1;
		System.out.println("friendFeed 도착");
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		System.out.println("email : "+email);
		String profile_img = ((MemberDTO)session.getAttribute("loginInfo")).getProfile_img();
		try {
			List<FeedDTO> list = service.getFriendFeed(ipage, email);
			System.out.println("feed size : "+list.size());
			List<String> profile_imgList = new ArrayList<>();
			List<List<String>> mediaList = new ArrayList<>();
			List<List<ReplyDTO>> replyList = new ArrayList<>();
			List<Integer> likeCheckList = new ArrayList<>();
			List<Integer> bookmarkCheckList = new ArrayList<>();
			for(FeedDTO tmp : list) {
				int feed_seq = tmp.getFeed_seq();
				String tmpEmail = tmp.getEmail();
				profile_imgList.add(service.getProfile_img(tmpEmail));
				mediaList.add(service.getMediaList(feed_seq));
//				replyList.add(service.viewAllReply(feed_seq));
				likeCheckList.add(service.likeCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail()));
				bookmarkCheckList.add(service.bookmarkCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail()));
			}
			
			System.out.println(list);
			System.out.println(profile_imgList);
			System.out.println(mediaList);
			System.out.println(replyList);
			System.out.println(likeCheckList);
			System.out.println(bookmarkCheckList);
			
			model.addAttribute("list", list);
			model.addAttribute("profile_imgList",profile_imgList);
			model.addAttribute("mediaList", mediaList);
			model.addAttribute("replyList", replyList);
			model.addAttribute("likeCheckList", likeCheckList);
			model.addAttribute("bookmarkCheckList", bookmarkCheckList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/feeds/friendFeed";
	}
	
	
	@RequestMapping(value = "/getFriendFeedAjax", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getFriendFeedAjax(Model model, String page) {
		if(page==null) {
			page="11";
		}
		int ipage = Integer.parseInt(page);
		System.out.println("friendFeed 도착");
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		System.out.println("email : "+email);
		JsonObject obj = new JsonObject();
		try {
			List<FeedDTO> list = service.getFriendFeed(ipage, email);
			if(list==null) {
				return "{\"result\" : \"false\"}";
			}
			System.out.println("feed size : "+list.size());
			List<List<String>> mediaList = new ArrayList<>();
			List<List<ReplyDTO>> replyList = new ArrayList<>();
			List<Integer> likeCheckList = new ArrayList<>();
			List<Integer> bookmarkCheckList = new ArrayList<>();
			for(FeedDTO tmp : list) {
				int feed_seq = tmp.getFeed_seq();
				mediaList.add(service.getMediaList(feed_seq));
//				replyList.add(service.viewAllReply(feed_seq));
				likeCheckList.add(service.likeCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail()));
				bookmarkCheckList.add(service.bookmarkCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail()));
			}
			System.out.println(list);
			System.out.println(mediaList);
			System.out.println(replyList);
			System.out.println(likeCheckList);
			System.out.println(bookmarkCheckList);

			Gson gson = new Gson();

			obj.addProperty("list", gson.toJson(list));
			obj.addProperty("mediaList", gson.toJson(mediaList));
			obj.addProperty("replyList", gson.toJson(replyList));
			obj.addProperty("likeCheckList", gson.toJson(likeCheckList));
			obj.addProperty("bookmarkCheckList", gson.toJson(bookmarkCheckList));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return obj.toString();
	}
	
	
	@RequestMapping("/modifyFeedProc")
	public String modifyFeedProc(FeedDTO dto,Model model) {
		System.out.println("게시물 수정 시작!");
		System.out.println(dto.getFeed_seq());
		try {
			int result = service.modifyFeed(dto);
			System.out.println(result + "행이 수정되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:detailView?feed_seqS="+dto.getFeed_seq();
	}
	
	@RequestMapping("/modifyFeedView")
	public String modifyFeedView(int feed_seq, Model model) {
		System.out.println("게시물 수정페이지 도착!");
		FeedDTO dto = null;
		List<String> list = null;
		try {
			dto = service.detailView(feed_seq);
			list = service.getMediaList(feed_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		model.addAttribute("media", list);
		return "/feeds/modifyFeedView";
	}



	//좋아요
	@RequestMapping(value = "/insertLike", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String insertLike(int feed_seq) {
		System.out.println("insertLike 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();

		try {
			service.insertLike(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	@RequestMapping(value = "/deleteLike", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String deleteLike(int feed_seq) {
		System.out.println("deleteLike 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
			service.deleteLike(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}




	//북마크
	@RequestMapping(value = "/insertBookmark", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String insertBookmark(int feed_seq) {
		System.out.println("insertBookmark 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
			service.insertBookmark(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	@RequestMapping(value = "/deleteBookmark", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String deleteBookmark(int feed_seq) {
		System.out.println("deleteBookmark 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
			service.deleteBookmark(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}




	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//                                             댓글기능
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	@RequestMapping(value ="/registerReply",produces = "text/html; charset=utf8")
	@ResponseBody
	public String registerReply(ReplyDTO dto) {
		System.out.println("댓글 등록도착!");
		System.out.println(dto.toString());
		String result =  null;
		try {
			if(dto.getDepth() == 0) {
				System.out.println("댓글");
				result = service.registerReply(dto);			
			}else{
				System.out.println("답글");
				result = service.registerReply(dto);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/modifyReply")
	public String modifyReply(FeedDTO dto) {
		return "feeds/myFeed";
	}

	@RequestMapping("/deleteReply")
	@ResponseBody
	public String deleteReply(int reply_seq) {
		System.out.println("댓글 삭제 도착!!");
		System.out.println(reply_seq+"이 댓글 삭제로 넘어옴!");
		int result = 0;
		try {
			result = service.deleteReply(reply_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result + "지워짐");
		return  reply_seq+"";
	}
	@RequestMapping("/updateReply")
	@ResponseBody
	public String updateReply(ReplyDTO dto) {
		System.out.println("댓글 수정 도착!!");
		System.out.println(dto.getReply_seq()+"댓글시퀀스!");
		System.out.println(dto.getContents()+"댓글콘텐츠!");
		int result = 0;
		try {
			result = service.updateReply(dto);
			System.out.println(result + "행이 업데이트되었습니다!");
			System.out.println("===========================");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result+"";
	}
}