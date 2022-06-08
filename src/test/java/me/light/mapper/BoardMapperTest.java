package me.light.mapper;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import me.light.AppTest;
import me.light.model.Board;

public class BoardMapperTest extends AppTest{

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	private DataSource dataSource;
	
	@Before
	public void setUp() throws IOException, SQLException {
		Reader reader = Resources.getResourceAsReader("sql/sql_board.sql");
		ScriptRunner runner = new ScriptRunner(dataSource.getConnection());
	}
	
	@Test
	@Ignore
	public void getListTest() {
		List<Board> list =  boardMapper.getList();
		assertEquals(4, list.size());
	}
	
	@Test
	@Ignore
	public void getTest() {
		Board board = boardMapper.get(1L);
		assertEquals("제목", board.getTitle());
	}
	
	@Test
	@Ignore
	public void insertTest() {
		Board board = new Board();
			board.setTitle("제목5");
			board.setContent("Content5");
			board.setWriter("Writer5");
			boardMapper.insert(board);
			Board getBoard = boardMapper.get(5L);
			
			assertEquals(board.getTitle(), getBoard.getTitle());
			assertEquals(board.getContent(), getBoard.getContent());
			assertEquals(board.getWriter(), getBoard.getWriter());
			assertEquals(board.getBno(), getBoard.getBno());
	}

	@Test
	public void updateTest() {
		Board board = boardMapper.get(1L);
		board.setContent("내용 수정됨");
		board.setTitle("제목 수정됨");
		boardMapper.update(board);
		assertEquals("내용 수정됨", board.getContent());
		assertEquals("제목 수정됨", board.getTitle() );
	}
	
	@Test
	public void deleteTest() {
		boardMapper.delete(1L);
		boardMapper.delete(2L);
		Board board1 = boardMapper.get(1L);
		Board board2 = boardMapper.get(2L);
		Board board3 = boardMapper.get(3L);
		assertNull(board1);
		assertNull(board2);
		assertNotNull(board3);
		
	}
}
