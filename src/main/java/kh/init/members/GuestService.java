package kh.init.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GuestService {

	@Autowired
	private MemberDAO dao;
	
	@Transactional("txManager")
	public int insert(MemberDTO dto, MultipartFile profile_img) {
		dto.setProfile_img(profile_img.getOriginalFilename());
		System.out.println("회원가입 서비스 진입");
		return dao.insert(dto);
	}	
}
