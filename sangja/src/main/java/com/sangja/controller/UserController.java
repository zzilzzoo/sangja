package com.sangja.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sangja.domain.CustomerVO;
import com.sangja.domain.Page;
import com.sangja.domain.UserCustVO;
import com.sangja.domain.UserMenuVO;
import com.sangja.domain.UserVO;
import com.sangja.service.CustomerService;
import com.sangja.service.UserMenuService;
import com.sangja.service.UserService;

@Controller
public class UserController {
	@Inject
	private UserService service;
	@Inject
	private CustomerService cuService;
	@Inject
	private UserMenuService umService;

	@RequestMapping(value = "/user-list", method = RequestMethod.GET)
	public void getList(HttpServletRequest req, Model model) throws Exception {
		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer unum;
		try {
			unum = uvvo.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 131);
		// System.out.print(umvo.getRead_yn());
		if (umvo.getRead_yn()==null) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}

		if (umvo.getRead_yn().equals("n")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		}

		model.addAttribute("umvo", umvo);
		
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);

		List<UserVO> list = null;
		list = service.list();

		model.addAttribute("list", list);
	}

	// 게시물 작성
	@RequestMapping(value = "/user-form", method = RequestMethod.GET)
	public void getWirte(HttpServletRequest req, Model model) throws Exception {
		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			return;
		}

		Integer unum;
		try {
			unum = uvvo.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 131);
		// System.out.print(umvo.getRead_yn());
		if (!umvo.getWrite_yn().equals("y")) {
			model.addAttribute("msg", "You do not have permission to write.");

			model.addAttribute("url", "/");
			return;

		}

		model.addAttribute("umvo", umvo);
		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
	}

	// 게시물 작성
	@RequestMapping(value = "/user-form", method = RequestMethod.POST)
	public String postWirte(UserVO vo) throws Exception {
		service.write(vo);
		return "redirect:/user-list";

	}

	// 아이디 중복
	@RequestMapping(value = "/id-check", method = RequestMethod.POST)
	@ResponseBody
	public Integer postIdCheck(@RequestParam("user_id") String user_id) throws Exception {
		int cnt = service.idCheck(user_id);
		return cnt;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("user_num") int user_num, Model model) throws Exception {

		UserVO vo = service.view(user_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/user-modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("user_num") int user_num, HttpServletRequest req, Model model)
			throws Exception {
		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			return;
		}

		Integer unum = uvvo.getUser_num();
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 131);
		// System.out.print(umvo.getRead_yn());
		if (umvo.getDelete_yn() != null) {
			if (!umvo.getDelete_yn().equals("y")) {
				model.addAttribute("msg", "You do not have permission to modify.");

				model.addAttribute("url", "/");
				return;

			}
		} else {			
			model.addAttribute("msg", "You do not have permission to modify.");

			model.addAttribute("url", "/");
			return;
		}

		model.addAttribute("umvo", umvo);
		
		UserVO vo = service.view(user_num);
		model.addAttribute("view", vo);

		List<CustomerVO> cuList = null;
		cuList = cuService.listForUser(user_num);
		model.addAttribute("cuList", cuList);

		List<CustomerVO> cuNotList = null;
		cuNotList = cuService.listForUser(0);
		model.addAttribute("cuNotList", cuNotList);

		List<UserMenuVO> umList = null;
		umList = umService.list(user_num);
		System.out.print(umList.size());
		model.addAttribute("umList", umList);

	}

	@RequestMapping(value = "/user-cust", method = RequestMethod.POST)
	public String postProductComms(Locale locale, UserCustVO vo) throws Exception {

		// ServletInputStream inputStream = request.getInputStream();
		// String messageBody = StreamUtils.copyToString(inputStream,
		// StandardCharsets.UTF_8);
		// ObjectMapper mapper = new ObjectMapper();
		// HashMap<String, String> result = new HashMap<String, String>();

		// int resultCnt = 0;

		System.out.println(vo.getUserCustVOList().size());
		System.out.println(vo.getUserCustVOList().get(0).getChb());
		System.out.println(vo.getUserCustVOList().get(0).getCust_num());
		System.out.println(vo.getUserCustVOList().get(0).getMng_user_num());

		for (int i = 0; i < vo.getUserCustVOList().size(); i++) {
			if (vo.getUserCustVOList().get(i).getChb() == 1) {
				cuService.modifyMngUser(vo.getUserCustVOList().get(i).getMng_user_num(),
						vo.getUserCustVOList().get(i).getCust_num());
			}
		}
		// return "redirect:product-form?prd_mng_num=" +
		// vo.getProductCommsList().get(0).getPrd_mng_num();
		// ModelAndView mv = new ModelAndView();
		// mv.setView(new RedirectView(
		// "redirect:product-form?prd_mng_num=" +
		// vo.getProductCommsList().get(0).getPrd_mng_num(), true));
		// return mv;
		return "redirect:user-modify?user_num=" + vo.getUserCustVOList().get(0).getMng_user_num();
	}

	@RequestMapping(value = "/user-cust-del", method = RequestMethod.POST)
	public String postProductCommsDel(Locale locale, UserCustVO vo) throws Exception {

		/*
		 * System.out.println(vo.getUserCustVOList().size());
		 * System.out.println(vo.getUserCustVOList().get(0).getChb());
		 * System.out.println(vo.getUserCustVOList().get(0).getCust_num());
		 * System.out.println(vo.getUserCustVOList().get(0).getMng_user_num());
		 */
		for (int i = 0; i < vo.getUserCustVOList().size(); i++) {
			if (vo.getUserCustVOList().get(i).getChb() == 1) {
				cuService.modifyMngUser(0, vo.getUserCustVOList().get(i).getCust_num());
			}
		}

		return "redirect:user-modify?user_num=" + vo.getUserCustVOList().get(0).getMng_user_num();
	}

	// 게시물 수정
	@RequestMapping(value = "/user-modify", method = RequestMethod.POST)
	public String postModify(UserVO vo, HttpServletRequest httpServletRequest) throws Exception {

		service.modify(vo);
		String sUser_num = httpServletRequest.getParameter("user_num");
		int user_num = Integer.parseInt(sUser_num);
		// 업데이트는 모든 데이터 삭제후 등록
		umService.deleteAll(user_num);
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String strDate = dateFormat.format(date);

		// basicProductCategory
		String mn_1 = httpServletRequest.getParameter("mn111_1");
		String mn_2 = httpServletRequest.getParameter("mn111_2");
		String mn_3 = httpServletRequest.getParameter("mn111_3");

		UserMenuVO umVo = new UserMenuVO();
		umVo.setUser_num(user_num);
		umVo.setMenu_num(111);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// basicProductProduct
		mn_1 = httpServletRequest.getParameter("mn112_1");
		mn_2 = httpServletRequest.getParameter("mn112_2");
		mn_3 = httpServletRequest.getParameter("mn112_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(112);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// basicCustomerCustomer
		mn_1 = httpServletRequest.getParameter("mn121_1");
		mn_2 = httpServletRequest.getParameter("mn121_2");
		mn_3 = httpServletRequest.getParameter("mn121_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(121);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// basicUserManagment
		mn_1 = httpServletRequest.getParameter("mn131_1");
		mn_2 = httpServletRequest.getParameter("mn131_2");
		mn_3 = httpServletRequest.getParameter("mn131_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(131);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// basicCustomerVisi
		mn_1 = httpServletRequest.getParameter("mn211_1");
		mn_2 = httpServletRequest.getParameter("mn211_2");
		mn_3 = httpServletRequest.getParameter("mn211_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(211);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// salesSalesOnSite
		mn_1 = httpServletRequest.getParameter("mn212_1");
		mn_2 = httpServletRequest.getParameter("mn212_2");
		mn_3 = httpServletRequest.getParameter("mn212_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(212);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// salesSalesOther
		mn_1 = httpServletRequest.getParameter("mn213_1");
		mn_2 = httpServletRequest.getParameter("mn213_2");
		mn_3 = httpServletRequest.getParameter("mn213_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(213);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);
		// salesOtherReport
		mn_1 = httpServletRequest.getParameter("mn214_1");
		mn_2 = httpServletRequest.getParameter("mn214_2");
		mn_3 = httpServletRequest.getParameter("mn214_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(214);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);
		// salesAr
		mn_1 = httpServletRequest.getParameter("mn221_1");
		mn_2 = httpServletRequest.getParameter("mn221_2");
		mn_3 = httpServletRequest.getParameter("mn221_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(221);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// salesClose
		mn_1 = httpServletRequest.getParameter("mn231_1");
		mn_2 = httpServletRequest.getParameter("mn231_2");
		mn_3 = httpServletRequest.getParameter("mn231_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(231);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// inventoryInventory1
		mn_1 = httpServletRequest.getParameter("mn311_1");
		mn_2 = httpServletRequest.getParameter("mn311_2");
		mn_3 = httpServletRequest.getParameter("mn311_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(311);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportSales1
		mn_1 = httpServletRequest.getParameter("mn411_1");
		mn_2 = httpServletRequest.getParameter("mn411_2");
		mn_3 = httpServletRequest.getParameter("mn411_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(411);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportInventory1
		mn_1 = httpServletRequest.getParameter("mn421_1");
		mn_2 = httpServletRequest.getParameter("mn421_2");
		mn_3 = httpServletRequest.getParameter("mn421_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(421);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportPL1
		mn_1 = httpServletRequest.getParameter("mn431_1");
		mn_2 = httpServletRequest.getParameter("mn431_2");
		mn_3 = httpServletRequest.getParameter("mn431_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(431);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportUsage1
		mn_1 = httpServletRequest.getParameter("mn441_1");
		mn_2 = httpServletRequest.getParameter("mn441_2");
		mn_3 = httpServletRequest.getParameter("mn441_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(441);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportAR1
		mn_1 = httpServletRequest.getParameter("mn451_1");
		mn_2 = httpServletRequest.getParameter("mn451_2");
		mn_3 = httpServletRequest.getParameter("mn451_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(451);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		// reportCommission1
		mn_1 = httpServletRequest.getParameter("mn461_1");
		mn_2 = httpServletRequest.getParameter("mn461_2");
		mn_3 = httpServletRequest.getParameter("mn461_3");

		umVo.setUser_num(user_num);
		umVo.setMenu_num(461);
		umVo.setRead_yn(mn_1);
		umVo.setWrite_yn(mn_2);
		umVo.setDelete_yn(mn_3);
		umVo.setCrt_ymdt(strDate);
		umService.write(umVo);

		return "redirect:/user-list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/user-delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("user_num") int user_num) throws Exception {

		// 메인글 삭제
		service.delete(user_num);
		umService.deleteAll(user_num);
		System.out.println("user_num : " + user_num);

		return "redirect:/user-list";
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());

		List<UserVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);

		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);

	}

	// 게시물 목록 + 페이징+검색 추가
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num,
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

		List<UserVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

	}
}
