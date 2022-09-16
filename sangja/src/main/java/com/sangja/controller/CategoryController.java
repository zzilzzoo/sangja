package com.sangja.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sangja.domain.CategoryVO;
import com.sangja.domain.Page;
//import com.sangja.domain.ScriptUtils;
import com.sangja.domain.UserMenuVO;
import com.sangja.domain.UserVO;
import com.sangja.service.CategoryService;
import com.sangja.service.UserMenuService;

@Controller
public class CategoryController {
	@Inject
	private CategoryService service;

	@Inject
	private UserMenuService umService;

	HttpSession session;

	@RequestMapping(value = "/category-list", method = RequestMethod.GET)
	public void getCategory(HttpServletRequest req, Model model) throws Exception {
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer unum = 0;
		try {
			unum = uvo.getUser_num();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 111);
		// System.out.print(umvo.getRead_yn());
		// HttpServletResponse resp;
		if (umvo.getRead_yn()==null) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}
		if (umvo.getRead_yn()!=null && umvo.getRead_yn().equals("n")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		}
		model.addAttribute("umvo", umvo);
		
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);

		List<CategoryVO> list = null;
		list = service.list();

		model.addAttribute("list", list);

	}

	// 게시물 작성
	@RequestMapping(value = "/category-form", method = RequestMethod.GET)
	public void getCategoryWirte(HttpServletRequest req, Model model) throws Exception {
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			return;
		}

		Integer unum = uvo.getUser_num();
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 111);
		// System.out.print(umvo.getRead_yn());
		// HttpServletResponse resp;
		if (umvo.getRead_yn().equals("n")) {
			model.addAttribute("msg", "You do not have permission to write.");

			model.addAttribute("url", "/");
			return;

		}
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
	}

	// 게시물 작성
	@RequestMapping(value = "/category-form", method = RequestMethod.POST)
	public String postCategoryWirte(HttpServletRequest httpServletRequest) throws Exception {

		String _ctgry_mng_num = httpServletRequest.getParameter("ctgry_mng_num");
		System.out.print(_ctgry_mng_num);
		int ctgry_mng_num = 0;
		if (_ctgry_mng_num == null) {
			ctgry_mng_num = 0;
		}
		if (_ctgry_mng_num != "") {
			ctgry_mng_num = Integer.parseInt(_ctgry_mng_num);
		}
		String ctgry_nm = httpServletRequest.getParameter("ctgry_nm");

		// System.out.print(ctgry_mng_num);
		// System.out.print(ctgry_nm);
		CategoryVO vo = new CategoryVO();

		vo.setCtgry_mng_num(ctgry_mng_num);
		vo.setCtgry_nm(ctgry_nm);

		if (ctgry_mng_num == 0) {
			service.write(vo);
		} else {
			service.modify(vo);
		}
		return "redirect:/category-list";

	}

	@RequestMapping(value = "/categoryView", method = RequestMethod.GET)
	public void getCategoryView(HttpServletRequest req,@RequestParam("user_num") int user_num, Model model) throws Exception {
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			return;
		}

		Integer unum = uvo.getUser_num();
		
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
		
		CategoryVO vo = service.view(user_num);
		model.addAttribute("view", vo);
		
		

	}

	// 게시물 수정
	@RequestMapping(value = "/category-modify", method = RequestMethod.GET)
	public void getCategoryModify(HttpServletRequest req,@RequestParam("cust_num") int cust_num, Model model) throws Exception {
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			return;
		}

		Integer unum = uvo.getUser_num();
		
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
		
		CategoryVO vo = service.view(cust_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/category-modify", method = RequestMethod.POST)
	public String postCategorytModify(CategoryVO vo) throws Exception {

		service.modify(vo);
		return "redirect:/Category-list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/category-delete", method = RequestMethod.GET)
	public String getCategoryDelete(@RequestParam("ctgry_mng_num") int ctgry_mng_num) throws Exception {

		// 메인글 삭제
		service.delete(ctgry_mng_num);
		return "redirect:/category-list";
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/CategorylistPage", method = RequestMethod.GET)
	public void getCategoryListPage(HttpServletRequest req,Model model, @RequestParam("num") int num) throws Exception {
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			return;
		}

		Integer unum = uvo.getUser_num();
		
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
		
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());

		List<CategoryVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);

		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);

	}

	// 게시물 목록 + 페이징+검색 추가
	@RequestMapping(value = "/listCategoryPageSearch", method = RequestMethod.GET)
	public void getCategoryListPageSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		// page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<CategoryVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

	}
}
