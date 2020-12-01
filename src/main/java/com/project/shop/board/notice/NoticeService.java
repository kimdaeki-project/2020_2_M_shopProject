package com.project.shop.board.notice;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.board.BoardDTO;
import com.project.shop.board.BoardService;
import com.project.shop.board.file.BoardFileDTO;
import com.project.shop.util.FileSaver;
import com.project.shop.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService implements BoardService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private FileSaver fileSaver;

	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/notice");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result = file2.delete();
		}
		return result;
	}
	
	public String summernote(MultipartFile file, HttpSession session)throws Exception{
		// 파일을 하드디스크에 저장하고 저장된 파일명을 리턴
		String path = session.getServletContext().getRealPath("/resources/upload/notice");
		System.out.println(path);
		File dest = new File(path);
		String fileName = fileSaver.save(file, dest);
		
		return fileName;
	}
	
	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setInsert(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(noticeDAO.getCount(pager));
		pager.makePage();
		return noticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getOne(boardDTO);
	}
	
//	@Override
//	public ArrayList<List> getPrev(BoardDTO boardDTO) throws Exception {
//		return noticeDAO.getPrev(boardDTO);
//	}
//	
//	@Override
//	public BoardDTO getNext(BoardDTO boardDTO) throws Exception {
//		return noticeDAO.getNext(boardDTO);
//	}
//	
//	@Override
//	public ArrayList<List> getPN(long num) throws Exception {
//		return noticeDAO.getPN(num);
//	}

}