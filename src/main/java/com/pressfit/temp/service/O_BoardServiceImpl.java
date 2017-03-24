package com.pressfit.temp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.pressfit.temp.common.util.FileUtils;
import com.pressfit.temp.dao.O_BoardDAO;


@Service("o_boardService")//컨테이너에 인스턴스 생성(=빈객체, new한다는 얘기) 
public class O_BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// @Autowired 자동 찾기 ( 특정 이름 혹은 클래스 모습이 비슷한 것  )
	@Resource(name="o_boardDAO")// 이름으로 찾아오기
	// alt+shift+R 같은 객체 동시 바꾸기
	private O_BoardDAO o_boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return o_boardDAO.selectBoardList(map);
		
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		o_boardDAO.insertBoard(map);
		
	    List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			o_boardDAO.insertFile(list.get(i));
		}
	}
	
	@Override
	public void replyprocessBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		o_boardDAO.replyprocessBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			o_boardDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		o_boardDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = o_boardDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = o_boardDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		o_boardDAO.updateBoard(map);
		
		o_boardDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				o_boardDAO.insertFile(tempMap);
			}
			else{
				o_boardDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		o_boardDAO.deleteBoard(map);
	}

	@Override
	public List<Map<String, Object>> selectcart(Map<String, Object> map) throws Exception {
		
		return o_boardDAO.selectCart(map);
	}

	@Override
	public void insertCart(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		System.out.println(map);
		System.out.println("서비스임플동작");
		o_boardDAO.insertCart(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			o_boardDAO.insertFile(list.get(i));
		}
		
	}

	@Override
	public List<Map<String, Object>> selectBuyCheck(Map<String, Object> map) throws Exception {

		System.out.println("서비스 :" +map);
		return o_boardDAO.selectBuyCheck(map);
	}

	@Override
	public void insertBuyCheck(Map<String, Object> map, HttpServletRequest request) throws Exception {
		o_boardDAO.insertBuyCheck(map);
		
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			o_boardDAO.insertFile(list.get(i));
		}
	}

	@Override
	public List<String> chkArr(List<String> List) throws Exception {
		
		System.out.println("서비스 :" +List);
		return o_boardDAO.chkArr(List);
	}
	
	
	
	
}
