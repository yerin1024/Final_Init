package kh.init.messages;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
}
