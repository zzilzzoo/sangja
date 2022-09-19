package com.sangja.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sangja.domain.CustomerVO;
import com.sangja.domain.Page;
import com.sangja.domain.UserMenuVO;
//import com.sangja.domain.PageMaker;
import com.sangja.domain.UserVO;
import com.sangja.service.CustomerService;
import com.sangja.service.UserMenuService;
import com.sangja.service.UserService;

@Controller
public class CustomerController {
	@Inject
	private CustomerService service;

	@Inject
	private UserService usService;

	@Inject
	private UserMenuService umService;

	@RequestMapping(value = "/customer-list", method = { RequestMethod.GET, RequestMethod.POST })
	public void getCustList(Model model, HttpServletRequest req,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term
	/*
	 * ,@RequestParam(value = "page_num", required = false) Integer
	 * page_num,@RequestParam(value = "post_num", required = false) Integer post_num
	 */) throws Exception {

		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

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
		UserMenuVO umvo = umService.view(unum, 121);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn() == null) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}

		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and mng_user_num=" + unum + " and cust_status <> 'delete'";

		} else {
			strSearch = " and cust_status <> 'delete'";
		}

		model.addAttribute("umvo", umvo);

		if (search_user != "" && search_user != null) {
			strSearch = "";
			strSearch = strSearch + " and mng_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {

			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		/*
		 * if (page_num == null) { page_num = 1; } if (post_num == null) { post_num =
		 * 10; }
		 */
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		// System.out.print("\n" + service.count(strSearch) + "\n");

		// PageMaker page = new PageMaker();
		// page.setPostNum(post_num);
		// page.setNum(page_num);
		// page.setCount(service.count(strSearch));

		// model.addAttribute("page", page); // 현재 페이지
		// model.addAttribute("select", page_num);
		// model.addAttribute("post_num", post_num);

		// strSearch = strSearch + " limit " + page.getDisplayPost() + "," +
		// page.getPostNum();

		List<CustomerVO> list = null;
		System.out.print(new Date() + " customer-list : " + strSearch + "\n");
		list = service.listByWhere(strSearch);

		int mng_user_num;
		// String mng_user_nm;
		UserVO uvo = null;
		for (int i = 0; i < list.size(); i++) {
			mng_user_num = list.get(i).getMng_user_num();
			uvo = usService.view(mng_user_num);

			if (uvo != null) {

				list.get(i).setMng_user_nm(uvo.getUser_nm_f() + " " + uvo.getUser_nm_l());
			} else {
				list.get(i).setMng_user_nm("");
			}

		}
		model.addAttribute("list", list);

		if (umvo.getRead_yn().equals("Territory Only")) {
			System.out.print("/order-list strSearch : Territory Only");

		} else {
			List<UserVO> uListC = null;
			uListC = usService.listbyWhere(" and category='commissioner'");
			model.addAttribute("uListC", uListC);

			List<UserVO> uListE = null;
			uListE = usService.listbyWhere(" and category='employee'");
			model.addAttribute("uListE", uListE);

			List<UserVO> uListS = null;
			uListS = usService.listbyWhere(" and category='seller'");
			model.addAttribute("uListS", uListS);
		}

		List<UserVO> uListNA = null;
		uListNA = usService.listbyWhere(" and 1=2");
		UserVO uvoNA = new UserVO();
		uvoNA.setUser_num(0);
		uvoNA.setUser_nm_f("No");
		uvoNA.setUser_nm_l("User");
		uListNA.add(uvoNA);

		model.addAttribute("uListNA", uListNA);

	}

	@RequestMapping(value = "/excel/customer-list", method = { RequestMethod.GET, RequestMethod.POST })
	public void getExcelCustList(HttpServletResponse response,Model model, HttpServletRequest req,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term
	/*
	 * ,@RequestParam(value = "page_num", required = false) Integer
	 * page_num,@RequestParam(value = "post_num", required = false) Integer post_num
	 */) throws Exception {

		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

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
		UserMenuVO umvo = umService.view(unum, 121);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn() == null) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}

		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and mng_user_num=" + unum + " and cust_status <> 'delete'";

		} else {
			strSearch = " and cust_status <> 'delete'";
		}

		model.addAttribute("umvo", umvo);

		if (search_user != "" && search_user != null) {
			strSearch = "";
			strSearch = strSearch + " and mng_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {

			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		/*
		 * if (page_num == null) { page_num = 1; } if (post_num == null) { post_num =
		 * 10; }
		 */
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		// System.out.print("\n" + service.count(strSearch) + "\n");

		// PageMaker page = new PageMaker();
		// page.setPostNum(post_num);
		// page.setNum(page_num);
		// page.setCount(service.count(strSearch));

		// model.addAttribute("page", page); // 현재 페이지
		// model.addAttribute("select", page_num);
		// model.addAttribute("post_num", post_num);

		// strSearch = strSearch + " limit " + page.getDisplayPost() + "," +
		// page.getPostNum();

		List<CustomerVO> list = null;
		System.out.print(new Date() + " customer-list : " + strSearch + "\n");
		list = service.listByWhere(strSearch);

		int mng_user_num;
		// String mng_user_nm;
		UserVO uvo = null;
		for (int i = 0; i < list.size(); i++) {
			mng_user_num = list.get(i).getMng_user_num();
			uvo = usService.view(mng_user_num);

			if (uvo != null) {

				list.get(i).setMng_user_nm(uvo.getUser_nm_f() + " " + uvo.getUser_nm_l());
			} else {
				list.get(i).setMng_user_nm("");
			}

		}

		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Customer");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// Header
		row = sheet.createRow(rowNum++);

		cell = row.createCell(0);
		cell.setCellValue("#");
		cell = row.createCell(1);
		cell.setCellValue("Name");
		cell = row.createCell(2);
		cell.setCellValue("Address");
		cell = row.createCell(3);
		cell.setCellValue("City");
		cell = row.createCell(4);
		cell.setCellValue("State");
		cell = row.createCell(5);
		cell.setCellValue("Zip Code");
		cell = row.createCell(6);
		cell.setCellValue("Visit Term(Week)");
		cell = row.createCell(7);
		cell.setCellValue("Sales Person");
		cell = row.createCell(8);
		cell.setCellValue("Status");

		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		for (int i = 0; i < list.size(); i++) {

			row = sheet.createRow(rowNum++);

			cell = row.createCell(0);
			cell.setCellValue(i + 1);
			cell = row.createCell(1);
			cell.setCellValue(list.get(i).getCust_nm());
			cell = row.createCell(2);
			cell.setCellValue(list.get(i).getAddr());
			cell = row.createCell(3);
			cell.setCellValue(list.get(i).getCity());
			cell = row.createCell(4);
			cell.setCellValue(list.get(i).getState());
			cell = row.createCell(5);
			cell.setCellValue(list.get(i).getZip_code());
			cell = row.createCell(6);
			cell.setCellValue(list.get(i).getVisit_term());
			cell = row.createCell(7);
			cell.setCellValue(list.get(i).getMng_user_nm());
			cell = row.createCell(7);
			cell.setCellValue(list.get(i).getCust_status());
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=customer.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();

	}

	// 게시물 작성
	@RequestMapping(value = "/customer-form", method = RequestMethod.GET)
	public void getCustWirte(HttpServletRequest req, Model model) throws Exception {
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
		UserMenuVO umvo = umService.view(unum, 121);
		// System.out.print(umvo.getRead_yn());

		model.addAttribute("umvo", umvo);
	}

	// 게시물 작성
	@RequestMapping(value = "/customer-form", method = RequestMethod.POST)
	public String postCustWirte(CustomerVO vo) throws Exception {

		service.write(vo);
		return "redirect:/customer-list";

	}

	@RequestMapping(value = "/CustView", method = RequestMethod.GET)
	public void getCustView(@RequestParam("user_num") int user_num, HttpServletRequest req, Model model)
			throws Exception {
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
		UserMenuVO umvo = umService.view(unum, 121);
		// System.out.print(umvo.getRead_yn());

		model.addAttribute("umvo", umvo);

		CustomerVO vo = service.view(user_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/customer-modify", method = RequestMethod.GET)
	public void getCustModify(@RequestParam("cust_num") int cust_num, HttpServletRequest req, Model model)
			throws Exception {

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
		UserMenuVO umvo = umService.view(unum, 121);
		// System.out.print(umvo.getRead_yn());

		model.addAttribute("umvo", umvo);

		CustomerVO vo = service.view(cust_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/customer-modify", method = RequestMethod.POST)
	public String postCustModify(CustomerVO vo) throws Exception {

		service.modify(vo);
		return "redirect:/customer-list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/customer-delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("cust_num") int cust_num) throws Exception {

		// 메인글 삭제
		service.deletemodify(cust_num);
		return "redirect:/customer-list";
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/CustlistPage", method = RequestMethod.GET)
	public void getCustListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count(""));

		List<CustomerVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);

		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);

	}

	// 게시물 목록 + 페이징+검색 추가
	@RequestMapping(value = "/listCustPageSearch", method = RequestMethod.GET)
	public void getCustListPageSearch(Model model, @RequestParam("num") int num,
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

		List<CustomerVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

	}
}
