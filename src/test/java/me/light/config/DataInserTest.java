package me.light.config;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import me.light.AppTest;
import me.light.mapper.BoardMapper;
import me.light.model.Board;


public class DataInserTest extends AppTest{
	
	@Autowired
	BoardMapper mapper;
	
	@Test
	public void insertData() {
		
		for (int j = 1 ; j <= 412 ; j++) {
			Board board = new Board();
			board.setTitle("페이징"+ j);
			board.setContent("content");
			board.setWriter("ㅇㅇ");
			mapper.insert(board);
		}
	}

}
