package me.light.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import me.light.AppTest;
import me.light.model.Board;

public class SearchData  extends AppTest{
	
	@Autowired
	BoardMapper mapper;
	
	@Test
	@Ignore
	public void dataInsert() {
		
		for (int j = 1 ; j <= 212 ; j++) {
			Board board = new Board();
			board.setTitle("페이징"+ j);
			board.setContent("content");
			board.setWriter("ㅇㅇ");
			mapper.insert(board);
		}
	}
	
	@Test
	public void dataInsert2() {
		
		for (int j = 1 ; j <= 212 ; j++) {
			Board board = new Board();
			board.setTitle("페이징 : JAVA"+ j);
			board.setContent("content");
			board.setWriter("ㅇㅇ");
			mapper.insert(board);
		}
	}

}
