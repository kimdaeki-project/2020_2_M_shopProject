package com.project.shop.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.member.MemberDTO;
import com.project.shop.util.FileSaver;
import com.project.shop.util.OrderPager;

@Service
@Transactional(rollbackFor = Exception.class)
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public int setSlideSeqUpdate(String []seqs,String []nums)throws Exception{
		int result=0;
	    for(int i=0;i<seqs.length;i++) {
	    	Top5DTO top5dto = new Top5DTO();
	    	top5dto.setSeq(Long.parseLong(seqs[i]));
	    	top5dto.setNum(Long.parseLong(nums[i]));
	    	result+=adminDAO.setSlideSeqUpdate(top5dto);
	    }
	    return result;
	}
	
	public int setSlideDelete(Top5DTO top5dto,HttpSession httpSession)throws Exception{
		String path = httpSession.getServletContext().getRealPath("/resources/upload/slide");
		int result=adminDAO.setSlideDelete(top5dto);
		if(result>0) {
			File dest = new File(path,top5dto.getImgName());
			if(dest.exists()) {
				dest.delete();
			}
		}
		
		return result;
	}
	
	
	public List<Top5DTO> getSlideList()throws Exception{
		return adminDAO.getSlideList();
	}
	
	public int setSlideInsert(Top5DTO top5dto,MultipartFile mainImg,HttpSession httpSession)throws Exception{
		String path = httpSession.getServletContext().getRealPath("/resources/upload/slide");
		System.out.println(path);
		File dest = new File(path);
		String imgName = "";
		imgName = fileSaver.save(mainImg, dest);
		top5dto.setImgName(imgName);
		return adminDAO.setSlideInsert(top5dto);
	}
	
	public List<Top5DTO> getTop5List(Top5DTO top5dto)throws Exception{
		return adminDAO.getTop5List(top5dto);
	}
	
	public Top5DTO getTodayInfo()throws Exception{
		return adminDAO.getTodayInfo();
	}
	
	public List<Top5DTO> getDayTotal(Top5DTO top5dto)throws Exception{
		List<Top5DTO> top5dtos =new ArrayList<Top5DTO>();
		for(int i=0;i<7;i++) {
			top5dto.setDay(i);
			top5dtos.add(adminDAO.getDayTotal(top5dto));
		}
		return top5dtos;
	}
	
	public Top5DTO getTodayDate()throws Exception{
		return adminDAO.getTodayDate();	
		}
	
	public List<MemberDTO> getMemberList(OrderPager pager)throws Exception{
		  pager.makeRow();
		  pager.setTotalCount(adminDAO.getMemberCount(pager));
		  pager.makePage();
		  return adminDAO.getMemberList(pager);
	}
}
