package com.sangja.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sangja.domain.CategoryVO;
import com.sangja.domain.Page;
import com.sangja.domain.ProductCommsVO;
import com.sangja.domain.ProductVO;
import com.sangja.domain.ScriptUtils;
import com.sangja.domain.UserMenuVO;
import com.sangja.domain.UserVO;
import com.sangja.service.CategoryService;
import com.sangja.service.ProductCommsService;
import com.sangja.service.ProductService;
import com.sangja.service.UserMenuService;
import com.sangja.service.UserService;

@Controller
public class ProductController {
	@Inject
	private ProductService service;
	@Inject
	private CategoryService cgService;
	@Inject
	private UserService usService;
	@Inject
	private ProductCommsService pcService;
	@Inject
	private UserMenuService umService;

	@RequestMapping(value = "/product-list_back", method = RequestMethod.GET)
	public void getProductList(HttpServletRequest req, Model model) throws Exception {
		HttpSession session;
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer unum;
		try {
			unum = uvo.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 112);
		// System.out.print(umvo.getRead_yn());
		if (umvo.getRead_yn() == null) {
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

		List<ProductVO> list = null;
		list = service.list();

		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/product-list")
	public void getProductListByWhere(HttpServletRequest req, Model model) throws Exception {
		HttpSession session;
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer unum;
		try {
			unum = uvo.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 112);
		// System.out.print(umvo.getRead_yn());
		if (umvo.getRead_yn() == null) {
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

		String filter = "";
		if (req.getParameter("filter-by") != null) {
			filter = req.getParameter("filter-by");
		}
		String strSearch = "";
		if (req.getParameter("search-term") != null) {
			strSearch = req.getParameter("search-term");
		}
		String strWhere = " and t1.sale_status<>'delete'";
		if (req.getParameter("filter-by") != null) {
			if (filter.equals("category")) {
				strWhere = "";
			}
			if (filter.equals("all")) {
				strWhere = "";
			} else if (filter.equals("category")) {
				strWhere = " and t1.ctgry_mng_num in (select ctgry_mng_num from tbl_category where ctgry_nm like '"
						+ strSearch + "%')";
			} else {
				strWhere = " and " + filter + " like '" + strSearch + "%'";
			}

		}

		System.out.print("filter:" + filter);

		List<ProductVO> list = null;
		list = service.listByWhere(strWhere);

		model.addAttribute("list", list);
	}

	// 게시물 작성
	@RequestMapping(value = "/product-form", method = RequestMethod.GET)
	public void getProductWirte(@RequestParam(value = "prd_mng_num", defaultValue = "0") int prd_mng_num,
			HttpServletRequest req, Model model) throws Exception {

		HttpSession session;
		session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("sess_user");
		if (uvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer unum;
		try {
			unum = uvo.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 112);
		// System.out.print(umvo.getRead_yn());
		if (umvo.getRead_yn().equals("n")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		}
		model.addAttribute("umvo", umvo);

		model.addAttribute("_prd_mng_num", prd_mng_num);
		// 상품정보
		ProductVO vo = service.view(prd_mng_num);
		model.addAttribute("view", vo);
		// selectbox 카테고리
		List<CategoryVO> cgList = null;
		cgList = cgService.list();
		// System.out.print(cgList.get(0).getCtgry_nm());
		model.addAttribute("cgList", cgList);
		// 커미션
		List<ProductCommsVO> pcList = null;
		pcList = pcService.list(prd_mng_num);
		model.addAttribute("pcList", pcList);

		// 팝업용 사용자 정보
		List<UserVO> usList = null;
		usList = usService.listForProduct(prd_mng_num);
		model.addAttribute("usList", usList);
	}

	@ResponseBody
	@RequestMapping(value = "/product-form_user", method = RequestMethod.GET)
	public String getProducUsertWirte(@RequestParam(value = "prd_mng_num", defaultValue = "0") int prd_mng_num,
			Model model) throws Exception {

		// 팝업용 사용자 정보
		List<UserVO> usList = null;
		usList = usService.list();
		model.addAttribute("usList", usList);
		return "replyListAjax";
	}

	// 게시물 작성
	@RequestMapping(value = "/product-form", method = RequestMethod.POST)
	public void postProductWirte(ProductVO vo, HttpServletResponse response) throws Exception {
		if (vo.getPrd_mng_num() == null) {
			vo.setPrd_mng_num(0);
		}
		// upc 코드 확인
		ProductVO pdvo = service.viewByUpc(vo.getUpc_code());
		//System.out.print(pdvo.getPrd_mng_num()+"\n");
		//System.out.print(vo.getPrd_mng_num());
		if (pdvo != null) {
			if (!pdvo.getPrd_mng_num().equals(vo.getPrd_mng_num())) {
				ScriptUtils.alertAndMovePage(response, "The UPC code already exists!!",
						"product-form?prd_mng_num=" + vo.getPrd_mng_num());
				return;
			}
		}

		if (vo.getPrd_mng_num() == 0) {
			service.write(vo);
		} else {
			service.modify(vo);
		}
		// service.write(vo);
		// return "redirect:/product-list";

		ScriptUtils.alertAndMovePage(response, "You have successfully saved the contents.",
				"product-form?prd_mng_num=" + vo.getPrd_mng_num());

	}

	@RequestMapping(value = "/product-del", method = RequestMethod.GET)
	public void postProductDel(@RequestParam("prd_mng_num") Integer prd_mng_num, HttpServletResponse response)
			throws Exception {
		if (prd_mng_num == null || prd_mng_num == 0) {
			ScriptUtils.alertAndMovePage(response, "The Pruduct not exists!!", "product-form");
			return;
		}
		// upc 코드 확인
		ProductVO pdvo = service.view(prd_mng_num);
		if (pdvo != null) {
			pdvo.setSale_status("delete");
		}
		service.modify(pdvo);
		// service.write(vo);
		// return "redirect:/product-list";

		ScriptUtils.alertAndMovePage(response, "You have successfully saved the contents.",
				"product-form?prd_mng_num=" + pdvo.getPrd_mng_num());

	}

	@RequestMapping(value = "/ProcudtView", method = RequestMethod.GET)
	public void getProductView(@RequestParam("prd_mng_num") int prd_mng_num, Model model) throws Exception {

		ProductVO vo = service.view(prd_mng_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/product-modify", method = RequestMethod.GET)
	public void getProductModify(@RequestParam("prd_mng_num") int prd_mng_num, Model model) throws Exception {

		ProductVO vo = service.view(prd_mng_num);
		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/product-comms", method = RequestMethod.POST)
	public String postProductComms(Locale locale, ProductCommsVO vo) throws Exception {

		// ServletInputStream inputStream = request.getInputStream();
		// String messageBody = StreamUtils.copyToString(inputStream,
		// StandardCharsets.UTF_8);
		// ObjectMapper mapper = new ObjectMapper();
		// HashMap<String, String> result = new HashMap<String, String>();

		// int resultCnt = 0;

		System.out.println(vo.getProductCommsList().size());
		System.out.println(vo.getProductCommsList().get(0).getChb());
		System.out.println(vo.getProductCommsList().get(0).getUser_num());
		System.out.println(vo.getProductCommsList().get(0).getPrd_mng_num());

		for (int i = 0; i < vo.getProductCommsList().size(); i++) {
			if (vo.getProductCommsList().get(i).getChb() == 1) {
				pcService.write(vo.getProductCommsList().get(i));
			}
		}
		// return "redirect:product-form?prd_mng_num=" +
		// vo.getProductCommsList().get(0).getPrd_mng_num();
		// ModelAndView mv = new ModelAndView();
		// mv.setView(new RedirectView(
		// "redirect:product-form?prd_mng_num=" +
		// vo.getProductCommsList().get(0).getPrd_mng_num(), true));
		// return mv;
		return "redirect:product-form?prd_mng_num=" + vo.getProductCommsList().get(0).getPrd_mng_num();
	}

	// 게시물 수정
	@RequestMapping(value = "/product-comms-modify", method = { RequestMethod.GET, RequestMethod.POST })
	public String postProductCommsModify(String prd_mng_num_c, String user_num, String comms_rate) throws Exception {

		// String _prd_mng_num = request.getParameter("prd_mng_num");
		// String _user_num = request.getParameter("user_num");
		// String _comms_rate = request.getParameter("comms_rate");
		System.out.println(prd_mng_num_c);
		int _prd_mng_num = Integer.parseInt(prd_mng_num_c);
		int _user_num = Integer.parseInt(user_num);
		double _comms_rate = Integer.parseInt(comms_rate);

		ProductCommsVO vo = new ProductCommsVO();
		vo.setPrd_mng_num(_prd_mng_num);
		vo.setUser_num(_user_num);
		vo.setComms_rate(_comms_rate);
		vo.setEditor("system");
		pcService.modify(vo);

		return "redirect:product-form?prd_mng_num=" + prd_mng_num_c;
	}

	// 게시물 삭제p
	/*
	 * @RequestMapping(value = "/product-delete", method = RequestMethod.GET) public
	 * String getDelete(@RequestParam("prd_mng_num") int prd_mng_num) throws
	 * Exception {
	 * 
	 * // 메인글 삭제 service.deletemodify(prd_mng_num); return "redirect:/product-list";
	 * }
	 */

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/ProductlistPage", method = RequestMethod.GET)
	public void getProductListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());

		List<ProductVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);

		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);

	}

	// 게시물 목록 + 페이징+검색 추가
	@RequestMapping(value = "/listProductPageSearch", method = RequestMethod.GET)
	public void getProductListPageSearch(Model model, @RequestParam("num") int num,
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

		List<ProductVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

	}
}
