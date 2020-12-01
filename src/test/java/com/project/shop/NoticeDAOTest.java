package com.project.shop;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.shop.board.BoardDTO;
import com.project.shop.board.notice.NoticeDAO;
import com.project.shop.board.notice.NoticeDTO;

public class NoticeDAOTest extends MyTestCase{

	@Autowired
	private NoticeDAO noticeDAO;
	@Test
	public void test() throws Exception {
		for(int i=1; i<=100; i++) {
			BoardDTO boardDTO = new NoticeDTO();
			boardDTO.setTitle("TITLE"+i);
			boardDTO.setContents("CONTENTS"+i);
			boardDTO.setWriter("admin1");
			noticeDAO.setInsert(boardDTO);
			if(i%10==0) {
				Thread.sleep(1000);
			}
		}
	}

}
