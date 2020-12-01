package com.project.shop.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.order.OrderDTO;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int setPointBuy(OrderDTO orderDTO)throws Exception{
		return memberDAO.setPointBuy(orderDTO);
	}
	
	
	public MemberDTO getPwFind(MemberDTO memberDTO)throws Exception{
		return memberDAO.getPwFind(memberDTO);
	}
	
	public MemberDTO getIdFind(MemberDTO memberDTO)throws Exception{
		return memberDAO.getIdFind(memberDTO);
	}
	
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getIdCheck(memberDTO);
	}
	public int setInsert(MemberDTO memberDTO) throws Exception{
		return memberDAO.setInsert(memberDTO);
		
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberLogin(memberDTO);
	}
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemberUpdate(memberDTO);
	}
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemberDelete(memberDTO);
	}
	public int setPointUpdate(OrderDTO orderDTO)throws Exception{
		return memberDAO.setPointUpdate(orderDTO);
	}
	public MemberPageDTO getMyPage(MemberPageDTO memberPageDTO)throws Exception{
		return memberDAO.getMyPage(memberPageDTO);
	}
}