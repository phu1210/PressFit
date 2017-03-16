package com.pressfit.temp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("o_boardDAO")//컨테이너에 인스턴스 생성(=빈객체, new한다는 얘기) 
public class O_BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("O_board.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		System.out.println("너가실행되냐?");
		insert("O_board.insertBoard", map);
	}
	
	public void replyprocessBoard(Map<String, Object> map) throws Exception{
		update("O_board.replyprocess", map);
		insert("O_board.insertBoard", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("O_board.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("O_board.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("O_board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("O_board.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
		insert("common.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectFileList", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception{
		update("common.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("common.updateFile", map);
	}
	
	public void insertCart(Map<String, Object> map) throws Exception{
		
		System.out.println(map);
		System.out.println("보드DAO정상동작");
		insert("O_board.insertCart", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCart(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("O_board.selectCart", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBuyCheck(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("O_board.selectBuyCheck", map);
	}
}
