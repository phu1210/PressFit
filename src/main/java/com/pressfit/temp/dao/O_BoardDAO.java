package com.pressfit.temp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("o_boardDAO")//ÄÁÅ×ÀÌ³Ê¿¡ ÀÎ½ºÅÏ½º »ý¼º(=ºó°´Ã¼, newÇÑ´Ù´Â ¾ê±â) 
public class O_BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("O_board.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		System.out.println("³Ê°¡½ÇÇàµÇ³Ä?");
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
		System.out.println("º¸µåDAOÁ¤»óµ¿ÀÛ");
		insert("O_board.insertCart", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCart(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("O_board.selectCart", map);
	}
	
	public void insertBuyCheck(Map<String, Object> map) throws Exception{
		System.out.println("®G®G");
		insert("O_board.insertBuyCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBuyCheck(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("O_board.selectBuyCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> chkArr(List<String> list) throws Exception{
		for(int i=0; i<list.size(); i++){
			selectList("O_board.selectBuyCheck", list);
		}
		/*for(String vo : list){
			System.out.println(vo);
		}*/
		return (List<String>)selectList("O_board.selectBuyCheck", list);
	}
	
}
