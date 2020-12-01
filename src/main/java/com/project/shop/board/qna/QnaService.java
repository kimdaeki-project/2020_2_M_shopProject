package com.project.shop.board.qna;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.board.BoardDTO;
import com.project.shop.board.BoardService;

import com.project.shop.util.FileSaver;
import com.project.shop.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaService implements BoardService{
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	public QnaDTO getSelectOne(QnaDTO qnaDTO)throws Exception{
		return qnaDAO.getSelectOne(qnaDTO);
	}
	
	
	public int setReply(BoardDTO boardDTO) throws Exception{
		int result = qnaDAO.setReplyUpdate(boardDTO);
		qnaDAO.getOne(boardDTO);
		result = qnaDAO.setReply(boardDTO);
		return result;
	}
	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/qna");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result = file2.delete();
		}
		return result;
	}
	public String summernote(MultipartFile file, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload/qna");
		System.out.println(path);
		File dest = new File(path);
		String fileName = fileSaver.save(file, dest);
		
		return fileName;
	}
	
	public long getCnt(BoardDTO boardDTO) throws Exception{
		return qnaDAO.getCnt(boardDTO);
	}
	

	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		
		return qnaDAO.setInsert(boardDTO);
	}
	
	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(qnaDAO.getCount(pager));
		pager.makePage();
		return qnaDAO.getList(pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getOne(boardDTO);
	}
	
	

}
