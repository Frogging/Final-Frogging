package com.frogging.app.controller;




import java.nio.charset.Charset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.AdminService;
import com.frogging.app.vo.PagingVO;



@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	AdminService service;
	ModelAndView mav = new ModelAndView();
	
	@GetMapping("adminPage")
	public ModelAndView adiminPage(){
		mav.setViewName("admin/adminPage");
		return mav;
	}
	
	@GetMapping("userlist")
	public ModelAndView userlist() {
		mav.addObject("userList", service.userList());
		mav.setViewName("admin/userlist");
		return mav;
	}

	@PostMapping("editProfile")
	public ResponseEntity<String> editProfile(String id, int restriction){
		// RestController에서는 ResponseBody를 보낼 수 있다.
		// 클라이언트에게 데이터와 뷰파일을 담을 수 있는 뷰페이지를 별도로 만들 필요가 없다.
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type","text/html; charset=utf-8");
		
		
		try {
			service.editProfile(id,restriction);
			
			String msg = "<script>";
			msg += "alert('회원정보가 수정되었습니다.');";
			msg += "location.href='/admin/userlist'";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//성공:200
		}catch(Exception e) {
			String msg = "<script>";
			msg += "alert('수정 실패하였습니다.');";
			msg += "history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			
			e.printStackTrace();
		}
		return entity;
	}


		
	@GetMapping("listDel")
	public ModelAndView listDel(String id) {
		service.listDel(id);
		mav.setViewName("redirect:/admin/userlist");
		return mav;
	}
	
	@GetMapping("profile")
	public ModelAndView profile(String id) {
		 
		mav.addObject("vo", service.getProfile(id));
		mav.setViewName("admin/editView");
		return mav;
	}
	
	@GetMapping("communityList")
	public ModelAndView communityList(PagingVO pVO) {
		mav = new ModelAndView();
		
		pVO.setTotalRecord(service.totalRecord(pVO));
		System.out.println(pVO.toString());
		
		mav.addObject("list", service.communityList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("admin/communityList");
		return mav;
	}
}
