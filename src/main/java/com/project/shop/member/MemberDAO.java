package com.project.shop.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.order.OrderDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public static String NAMESPACE="com.project.shop.member.MemberDAO.";
	
	public int setPointBuy(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setPointBuy", orderDTO);
	}
	
	public MemberDTO getPwFind(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPwFind", memberDTO);
	}
	
	public MemberDTO getIdFind(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getIdFind", memberDTO);
	}
	
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getIdCheck", memberDTO);
	}
	
	public int setInsert(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", memberDTO);
	}
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}
	
	public int setPointUpdate(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setPointUpdate", orderDTO);
	}
	
	public MemberPageDTO getMyPage(MemberPageDTO memberPageDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMyPage", memberPageDTO);
	}
}
