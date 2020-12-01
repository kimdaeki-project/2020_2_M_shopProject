package com.project.shop.review;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.util.ReviewPager;
import com.project.shop.util.FileSaver;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Autowired
	private FileSaver fileSaver;
	
	public List<ReviewDTO> pageList(ReviewPager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(reviewDAO.getCount(pager));
		pager.makePage();

		return reviewDAO.pageList(pager);
	}
	
	public int setInsert(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.setInsert(reviewDTO);
	}
	
	public List<ReviewDTO> getList(ReviewPager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(reviewDAO.getCount(pager));
		pager.makePage();

		return reviewDAO.getList(pager);
	}

	
	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/review");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result=file2.delete();
		}
		
		return result;
	}

	
	public String summernote(MultipartFile file, HttpSession session) throws Exception{
		//파일을 하드디스크에 저장하고 저장된 파일명을 리턴
		String path = session.getServletContext().getRealPath("/resources/upload/review");
		File dest = new File(path);
		String fileName = fileSaver.save(file, dest);
		return fileName;
	}
	
	
	
}
