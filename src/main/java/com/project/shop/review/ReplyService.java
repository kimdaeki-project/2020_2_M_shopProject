package com.project.shop.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	public int setReply(ReplyDTO replyDTO) throws Exception{
		
		return replyDAO.setReply(replyDTO);
	}
	
	public List<ReplyDTO> getList(ReplyDTO replyDTO) throws Exception{
		
		return replyDAO.getList(replyDTO);
	}
	
	public int setDelete(ReplyDTO replyDTO) throws Exception{
		
		return replyDAO.setDelete(replyDTO);
	}
	   public int setUpdate(ReplyDTO replyDTO) throws Exception {
		    return replyDAO.setUpdate(replyDTO);
		   }
	
}
