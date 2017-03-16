package com.pressfit.temp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void replyprocessBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectcart(Map<String, Object> map) throws Exception;
	
	void insertCart(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> selectBuyCheck(Map<String, Object> map) throws Exception;
}
