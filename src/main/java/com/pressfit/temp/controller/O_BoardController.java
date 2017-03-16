package com.pressfit.temp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pressfit.temp.common.CommandMap;
import com.pressfit.temp.service.BoardService;

@Controller
public class O_BoardController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="o_boardService")
	private BoardService o_boardService;
	
	@RequestMapping(value="/O_board/openBoardList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/O_board/boardList");
    	System.out.println(commandMap.getMap());
    	return mv;
    }
	 
	@RequestMapping(value="/O_board/selectBoardList.do")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    System.out.println(commandMap.getMap());
	    List<Map<String,Object>> list = o_boardService.selectBoardList(commandMap.getMap());
	    mv.addObject("list", list);
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	     
	    return mv;
	}
	
	@RequestMapping(value="/O_board/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/O_board/boardWrite");
		System.out.println(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value="/O_board/openBoardReply.do")
	public ModelAndView openBoardReply(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/O_board/boardReply");
		
		Map<String,Object> map = o_boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		
		return mv;
	}
	
	@RequestMapping(value="/O_board/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/O_board/openBoardList.do");
		System.out.println(commandMap.getMap());
		System.out.println(request);
		o_boardService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}

	@RequestMapping(value="/O_board/replyinsertBoard.do")
	public ModelAndView replyBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/O_board/openBoardList.do");

		o_boardService.replyprocessBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/O_board/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/O_board/boardDetail");
		System.out.println(commandMap.getMap());
		Map<String,Object> map = o_boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/O_board/openBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/O_board/boardUpdate");
		
		Map<String,Object> map = o_boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/O_board/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/O_board/openBoardDetail.do");
		
		o_boardService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/O_board/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/O_board/openBoardList.do");
		
		o_boardService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/add/openBoardBasket.do")
	public ModelAndView openBoardBasket(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/add/boardBasket");
	
		List<Map<String,Object>> map = o_boardService.selectcart(commandMap.getMap());
		
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/O_board/insertBasket.do")
	public ModelAndView insertBasket(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/O_board/openBoardList.do");
		
		System.out.println(commandMap.getMap());
		System.out.println(request);
		o_boardService.insertCart(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/add/openBoardBuy.do")
	public ModelAndView openBoardBuy(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/add/boardBuy");
		System.out.println(commandMap.getMap());
		List<Map<String,Object>> map = o_boardService.selectBuyCheck(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
}