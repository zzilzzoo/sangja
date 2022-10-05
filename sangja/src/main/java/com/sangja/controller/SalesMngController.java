package com.sangja.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Currency;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sangja.domain.CustSalePriceVO;
import com.sangja.domain.CustomerVO;
import com.sangja.domain.InvoiceVO;
import com.sangja.domain.PackingProductVO;
import com.sangja.domain.PackingVO;
import com.sangja.domain.Page;
import com.sangja.domain.ProductVO;
import com.sangja.domain.SaleFileVO;
import com.sangja.domain.SalePayRecVO;
import com.sangja.domain.SaleProdVO;
import com.sangja.domain.SaleVO;
import com.sangja.domain.ScriptUtils;
import com.sangja.domain.UserMenuVO;
import com.sangja.domain.UserVO;
import com.sangja.service.CustSalePriceService;
import com.sangja.service.CustomerService;
import com.sangja.service.InvoiceService;
import com.sangja.service.PackingProductService;
import com.sangja.service.PackingService;
import com.sangja.service.ProductService;
import com.sangja.service.SaleFileService;
import com.sangja.service.SalePayRecService;
import com.sangja.service.SaleProdService;
import com.sangja.service.SaleService;
import com.sangja.service.UserMenuService;
import com.sangja.service.UserService;

@Controller
public class SalesMngController {
	@Inject
	private CustomerService cuService;
	@Inject
	private CustSalePriceService cuspService;
	@Inject
	private UserService usService;
	@Inject
	private SaleService saleService;
	@Inject
	private ProductService pdService;
	@Inject
	private SaleProdService spService;
	@Inject
	private SalePayRecService payService;
	@Inject
	private SaleFileService sfService;
	@Inject
	private PackingService pkService;
	@Inject
	private PackingProductService pkpService;
	@Inject
	private InvoiceService invService;
	@Inject
	private UserMenuService umService;

	@RequestMapping(value = "/today-visit", method = { RequestMethod.GET, RequestMethod.POST })
	public void getCustList(Model model, HttpServletRequest req,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws Exception {

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
		System.out.print(unum);
		UserMenuVO umvo = umService.view(unum, 211);
		System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("None")) {
			strSearch = strSearch + " and 1=2";

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and mng_user_num = " + unum;

		} else {

		}
		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);
		// System.out.print("\n" + search_user + "\n");
		// System.out.print("\n" + filter_by + "\n");
		// System.out.print("\n" + search_term + "\n");

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and mng_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		strSearch = strSearch + " and cust_status <> 'delete'";
		/*
		 * if (page_num == null) { page_num = 1; } if (post_num == null) { post_num =
		 * 10; }
		 */
		// 최종 판매일(최종 방문일 last_visit_ymd 에서 visit_term(week단위)*7일 지난경우
		// strSearch = strSearch
		// + " and (last_visit_ymd is null or
		// date_add(str_to_date(last_visit_ymd,'%Y-%m-%d'),interval visit_term*7
		// day)<=DATE_FORMAT(now(), '%Y-%m-%d'))";
		// 정렬
		strSearch = strSearch
				+ " order by mng_user_num desc, date_add(str_to_date(last_visit_ymd,'%Y-%m-%d'),interval visit_term*7 day) desc";

		System.out.print(new Date() + " today-visit : " + strSearch + "\n");

		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		List<CustomerVO> list = null;
		list = cuService.listByWhere(strSearch);

		model.addAttribute("list", list);

		List<UserVO> uListC = null;
		uListC = usService.listbyWhere(" and category='commissioner'");
		model.addAttribute("uListC", uListC);

		List<UserVO> uListE = null;
		uListE = usService.listbyWhere(" and category='employee'");
		model.addAttribute("uListE", uListE);

		System.out.print(uListE.size());

		List<UserVO> uListS = null;
		uListS = usService.listbyWhere(" and category='seller'");
		model.addAttribute("uListS", uListS);

		List<UserVO> uListNA = null;
		uListNA = usService.listbyWhere(" and 1=2");
		UserVO uvoNA = new UserVO();
		uvoNA.setUser_num(0);
		uvoNA.setUser_nm_f("No");
		uvoNA.setUser_nm_l("User");
		uListNA.add(uvoNA);
		model.addAttribute("uListNA", uListNA);

		Date date = new Date();
		SimpleDateFormat dateFormatCST = new SimpleDateFormat("MM/dd/yyyy");
		dateFormatCST.setTimeZone(TimeZone.getTimeZone("CST"));

		String formattedDateCST = dateFormatCST.format(date);
		model.addAttribute("serverTimeCST", formattedDateCST);
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/on-site-sales", method = RequestMethod.GET)
	public void getOnSiteSales(@RequestParam(value = "cust_num", defaultValue = "0") int cust_num,
			@RequestParam(value = "sale_num", defaultValue = "x") String sale_num, Model model, HttpServletRequest req)
			throws Exception {

		System.out.print((new Date().toString()) + "getOnSiteSales1 sale_num :" + sale_num + "\n");

		HttpSession sess = req.getSession();

		UserVO ssuser = (UserVO) sess.getAttribute("sess_user");
		String unm_f = "";
		String unm_l = "";
		if (ssuser == null) {
			model.addAttribute("msg", "You do not have login session.");
			model.addAttribute("url", "/");
			return;
		}
		Integer unum;
		try {
			unum = ssuser.getUser_num();
		} catch (Exception e1) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		try {
			if (ssuser.getUser_nm_f() != null) {
				unm_f = ssuser.getUser_nm_f();
			}
			if (ssuser.getUser_nm_l() != null) {
				unm_l = ssuser.getUser_nm_l();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		UserMenuVO umvo = umService.view(unum, 212);
		System.out.print(umvo.getRead_yn());
		// String strSearch = "";
		if (umvo.getRead_yn() != null) {
			if (umvo.getRead_yn().equals("n")) {
				model.addAttribute("msg", "You do not have permission to read.");

				model.addAttribute("url", "/");
				return;

			}
		} else {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}
		String msg = (String) req.getParameter("msg");
		System.out.print((new Date().toString()) + "getOnSiteSales1 msg :" + msg + "\n");
		if (msg != "") {
			model.addAttribute("msg", msg);
		}
		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);

		CustomerVO custvo = cuService.view(cust_num);
		model.addAttribute("custvo", custvo);

		List<CustomerVO> cuList = null;
		cuList = cuService.list();
		model.addAttribute("cuList", cuList);
		System.out.print(new Date().toString() + "user count : " + cuList.size() + "\n");
		String editMode = "new";
		if (sale_num.equals("x")) {
			editMode = "new";
		} else {
			editMode = "modify";
		}
		System.out.print((new Date().toString()) + "getOnSiteSales2 sale_num :" + sale_num + "\n");

		model.addAttribute("editMode", editMode);
		System.out.print(editMode);

		String salenum = sale_num;
		System.out.print((new Date().toString()) + ":" + salenum + "\n");
		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);
		if (sale_num.equals("x") && custvo != null) {
			// System.out.print("yy");
			salevo = new SaleVO();
			salevo.setCust_num(custvo.getCust_num());
			salevo.setCust_nm(custvo.getCust_nm());
			salevo.setAddr(custvo.getAddr());
			salevo.setCity(custvo.getCity());
			salevo.setState(custvo.getState());
			salevo.setZip_code(custvo.getZip_code());
			// 신규면 채번

		}
		if (sale_num.equals("x")) {
			// salenum = saleService.getSaleNum("ON");
			salenum = saleService.getSaleNum(unm_f.substring(0, 1) + unm_l.substring(0, 1));

		} else {
			cust_num = salevo.getCust_num();
		}
		System.out.print((new Date().toString()) + "getOnSiteSales3 sale_num :" + sale_num + "\n");
		System.out.print((new Date().toString()) + "getOnSiteSales3 salenum :" + salenum + "\n");

		// 미납이 있는 판매내역
		List<SaleVO> saleList = null;
		if (cust_num != 0) {
			saleList = saleService.listByWhere(" and cust_num='" + cust_num + "' and tot_ord_amt > tot_pay_amt");
		}
		model.addAttribute("saleList", saleList);

		// System.out.print(salevo.getCust_nm());
		model.addAttribute("salevo", salevo);

		model.addAttribute("salenum", salenum);

		System.out.print((new Date().toString()) + "getOnSiteSales3 sale_num :" + sale_num + "\n");
		System.out.print((new Date().toString()) + "getOnSiteSales3 salenum :" + salenum + "\n");

		List<ProductVO> pcList = null;
		pcList = pdService.list();
		model.addAttribute("pcList", pcList);

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);
		// System.out.println(spvoList.size());
		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		System.out.print((new Date().toString()) + ":" + salenum + "\n");

	}

	@RequestMapping(value = "/on-site-sales", method = RequestMethod.POST)
	public void postOnSiteSales(@RequestParam(value = "sale_num", defaultValue = "0") String sale_num, SaleVO svo,
			SaleProdVO spvo, HttpServletResponse response) throws Exception {

		System.out.print((new Date().toString()) + "postOnSiteSales:" + svo.getSale_num() + "\n");

		String sale_ymd = "";
		String sale_time = "";
		String[] sale_nums = sale_num.split(",");
		// sale_num 두개 넘어오는 거 보정
		if (sale_nums.length > 1) {
			sale_num = sale_nums[0];
			svo.setSale_num(sale_num);
		}
		try {
			svo.setSale_type("onsite");

			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			sale_ymd = dateFormatD.format(date);

			DateFormat dateFormatT = new SimpleDateFormat("HH:mm:ss");
			dateFormatT.setTimeZone(TimeZone.getTimeZone("CST"));
			sale_time = dateFormatT.format(date);

			svo.setSale_ymd(sale_ymd);
			svo.setSale_time(sale_time);
			// on site 는 sale_amt 와 ord_amt 같은
			svo.setTot_ord_amt(svo.getTot_sale_amt());

		} catch (Exception e) {
			// 에러시 수행;
			System.out.println(e.getMessage());
		}

		// old vo
		SaleVO osvo = saleService.view(sale_num);
		if (osvo != null) {
			svo.setSale_ymd(osvo.getSale_ymd());
			svo.setSale_time(osvo.getSale_time());
			svo.setTot_pay_amt(osvo.getTot_pay_amt());
			svo.setLast_pay_ymdt(osvo.getLast_pay_ymdt());
		}
		// 삭제후
		saleService.delete(sale_num);
		// 저장
		saleService.write(svo);

		cuService.modifyVisitYmd(svo.getCust_num(), sale_ymd);

		spService.deleteAll(sale_num);
		// 모두 지우고 저장
		if (spvo.getSaleProdVOList() != null) {
			for (int i = 0; i < spvo.getSaleProdVOList().size(); i++) {
				// 판매번호 셋팅
				spvo.getSaleProdVOList().get(i).setSale_num(svo.getSale_num());
				// 값이 중복으로 넘어오는 경우 있어 처리함..스프링 버그인듯
				String[] sale_opts = spvo.getSaleProdVOList().get(i).getSale_opt().split(",");
				if (sale_opts.length > 1) {
					spvo.getSaleProdVOList().get(i).setSale_opt(sale_opts[0]);
				}
				// System.out.println(spvo.getSaleProdVOList().get(i).getSale_price());
				spService.write(spvo.getSaleProdVOList().get(i));
				// System.out.print((new Date().toString()) + "svo.getCust_num():" +
				// svo.getCust_num() + "\n");
				// System.out.print((new Date().toString()) +
				// "spvo.getSaleProdVOList().get(i).getPrd_mng_num():" +
				// spvo.getSaleProdVOList().get(i).getPrd_mng_num() + "\n");
				cuspService.delete(svo.getCust_num(), spvo.getSaleProdVOList().get(i).getPrd_mng_num());

				CustSalePriceVO cspvo = new CustSalePriceVO();
				cspvo.setCust_num(svo.getCust_num());
				cspvo.setPrd_mng_num(spvo.getSaleProdVOList().get(i).getPrd_mng_num());
				cspvo.setSale_price(spvo.getSaleProdVOList().get(i).getSale_price());
				cuspService.write(cspvo);
			}
		}
		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());
		System.out.print((new Date().toString()) + "postOnSiteSales:" + svo.getSale_num() + "\n");

		ScriptUtils.alertAndMovePage(response, "You have successfully saved the contents.",
				"on-site-sales?sale_num=" + sale_num);
		// return "redirect:on-site-sales?sale_num=" + sale_num;
	}

	@RequestMapping(value = "/on-site-sales2", method = RequestMethod.POST)
	public @ResponseBody String postOnSiteSales2(@RequestParam(value = "sale_num", defaultValue = "0") String sale_num,
			SaleVO svo, SaleProdVO spvo) throws Exception {

		String sale_ymd = "";
		String sale_time = "";
		String[] sale_nums = sale_num.split(",");
		// sale_num 두개 넘어오는 거 보정
		if (sale_nums.length > 1) {
			sale_num = sale_nums[0];
			svo.setSale_num(sale_num);
		}
		try {
			svo.setSale_type("onsite");

			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			sale_ymd = dateFormatD.format(date);

			DateFormat dateFormatT = new SimpleDateFormat("HH:mm:ss");
			dateFormatT.setTimeZone(TimeZone.getTimeZone("CST"));
			sale_time = dateFormatT.format(date);

			svo.setSale_ymd(sale_ymd);
			svo.setSale_time(sale_time);
			// on site 는 sale_amt 와 ord_amt 같은
			svo.setTot_ord_amt(svo.getTot_sale_amt());

		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}

		// old vo
		SaleVO osvo = saleService.view(sale_num);
		if (osvo != null) {
			svo.setSale_ymd(osvo.getSale_ymd());
			svo.setSale_time(osvo.getSale_time());
			svo.setTot_pay_amt(osvo.getTot_pay_amt());
			svo.setLast_pay_ymdt(osvo.getLast_pay_ymdt());
		}

		saleService.delete(sale_num);

		saleService.write(svo);

		cuService.modifyVisitYmd(svo.getCust_num(), sale_ymd);

		spService.deleteAll(sale_num);
		// 모두 지우고 저장
		if (spvo.getSaleProdVOList() != null) {
			for (int i = 0; i < spvo.getSaleProdVOList().size(); i++) {
				// 판매번호 셋팅
				spvo.getSaleProdVOList().get(i).setSale_num(svo.getSale_num());
				String[] sale_opts = spvo.getSaleProdVOList().get(i).getSale_opt().split(",");
				if (sale_opts.length > 1) {
					spvo.getSaleProdVOList().get(i).setSale_opt(sale_opts[0]);
				}
				// System.out.println(spvo.getSaleProdVOList().get(i).getSale_price());
				spService.write(spvo.getSaleProdVOList().get(i));
			}
		}
		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());
		System.out.print((new Date().toString()) + ":" + svo.getSale_num() + "\n");

		return sale_num;
	}

	@RequestMapping(value = "/sale-pay", method = RequestMethod.POST)
	public String postSalePay(HttpServletRequest request) throws Exception {

		String sale_num = request.getParameter("pay_sale_num");
		System.out.println("postSalePay:" + sale_num);
		String pay_type = request.getParameter("pay_type");
		System.out.println("postSalePay:" + pay_type);
		String check_no = request.getParameter("check_no");
		System.out.println("postSalePay:" + check_no);
		String _pay_amt = request.getParameter("pay_amt");
		String return_url = request.getParameter("posturl");

		double pay_amt = 0;
		try {
			pay_amt = Double.parseDouble(_pay_amt);
		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}
		String pay_ymdt = "";

		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone("CST"));
		pay_ymdt = dateFormat.format(date);

		SalePayRecVO vo = new SalePayRecVO();
		try {
			vo.setPay_num(0);
			vo.setSale_num(sale_num);
			vo.setPay_type(pay_type);
			vo.setCheck_no(check_no);
			vo.setPay_amt(pay_amt);
			vo.setPay_ymdt(pay_ymdt);
		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}
		// 내역등록
		payService.write(vo);
		// 총결제금액 수정

		saleService.modifyPayAmt(sale_num, pay_amt, pay_ymdt);

		// request.setAttribute("msg", "The deposit is complete.");
		String msg = "The deposit is complete.";
		// request.setAttribute("url", return_url + "?sale_num=" + sale_num);
		// return "alert";

		return "redirect:" + return_url + "?sale_num=" + sale_num + "&msg=" + msg;
	}

	@RequestMapping(value = "/sale-file", method = RequestMethod.POST)
	public String postSaleFile(@RequestParam(value = "sale_num", defaultValue = "0") String sale_num,
			@RequestParam(value = "posturl", defaultValue = "0") String posturl,
			@RequestParam(value = "pay_type", defaultValue = "ar") String pay_type,
			@RequestParam MultipartFile upload_file) throws Exception {

		// String sale_num = request.getParameter("sale_num");
		System.out.println(sale_num);
		// String posturl = request.getParameter("posturl");
		System.out.println(posturl);

		// MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		// MultipartFile mutiFile = request.getFile("upload_file");
		// String file_Path = "D:\\sprPrj\\sangja\\src\\main\\webapp\\resources\\img";
		String file_Path = "/usr/local/src/apache-tomcat-9.0.60/webapps/sangja/resources/upimg";

		String uuid = UUID.randomUUID().toString().toUpperCase();
		String fnm = upload_file.getOriginalFilename();
		String ext = fnm.substring(fnm.lastIndexOf(".") + 1);
		// file upload to system
		File converFile = new File(file_Path, sale_num + "." + ext);
		// logger.info("fileUpload converFile={}", converFile);
		upload_file.transferTo(converFile);

		String sfnm = converFile.getName();

		System.out.println(fnm);
		System.out.println(sfnm);
		// 파일관련 db저장
		SaleFileVO sfvo = new SaleFileVO();
		try {
			sfvo.setFile_num(uuid);
			sfvo.setSale_num(sale_num);
			sfvo.setSave_folder(file_Path);
			sfvo.setOrg_file_nm(fnm);
			sfvo.setSave_file_nm(sfnm);

		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}
		// 파일은 하나만 업로드 지우고 저장
		sfService.deleteAll(sale_num);
		sfService.write(sfvo);

		// 결제정보에 ar로저장
		String pay_ymdt = "";

		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone("CST"));
		pay_ymdt = dateFormat.format(date);

		SalePayRecVO vo = new SalePayRecVO();
		try {
			vo.setPay_num(0);
			vo.setSale_num(sale_num);
			vo.setPay_type(pay_type);
			vo.setPay_amt(0);
			vo.setPay_ymdt(pay_ymdt);
			vo.setFile_num(uuid);

		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}
		// 입금내역으로 안잡음
		// payService.write(vo);

		return "redirect:" + posturl + "?sale_num=" + sale_num;
		// return "redirect:upload";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/other-sales", method = RequestMethod.GET)
	public void getOtherSales(@RequestParam(value = "cust_num", defaultValue = "0") int cust_num,
			@RequestParam(value = "sale_num", defaultValue = "x") String sale_num, Model model, HttpServletRequest req)
			throws Exception {

		HttpSession sess = req.getSession();

		UserVO ssuser = (UserVO) sess.getAttribute("sess_user");
		Integer unum;
		try {
			unum = ssuser.getUser_num();
		} catch (Exception e) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		String unm_f = "";
		String unm_l = "";
		if (ssuser == null) {
			model.addAttribute("msg", "You do not have login session.");
			model.addAttribute("url", "/");
			return;
		}

		if (ssuser.getUser_nm_f() != null) {
			unm_f = ssuser.getUser_nm_f();
		}
		if (ssuser.getUser_nm_l() != null) {
			unm_l = ssuser.getUser_nm_l();
		}

		UserMenuVO umvo = umService.view(unum, 213);
		System.out.print(umvo.getRead_yn());
		// String strSearch = "";
		if (umvo.getRead_yn() != null) {
			if (umvo.getRead_yn().equals("n")) {
				model.addAttribute("msg", "You do not have permission to read.");

				model.addAttribute("url", "/");
				return;

			}
		} else {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;
		}

		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(unum);
		model.addAttribute("umList", umList);

		CustomerVO custvo = cuService.view(cust_num);
		model.addAttribute("custvo", custvo);

		List<CustomerVO> cuList = null;
		cuList = cuService.list();
		model.addAttribute("cuList", cuList);

		String editMode = "new";
		if (sale_num.equals("x")) {
			editMode = "new";
		} else {
			editMode = "modify";
		}
		model.addAttribute("editMode", editMode);
		System.out.print(editMode);

		String salenum = sale_num;
		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);
		if (sale_num.equals("x") && custvo != null) {
			// System.out.print("yy");
			salevo = new SaleVO();
			salevo.setCust_num(custvo.getCust_num());
			salevo.setCust_nm(custvo.getCust_nm());
			salevo.setAddr(custvo.getAddr());
			salevo.setCity(custvo.getCity());
			salevo.setState(custvo.getState());
			salevo.setZip_code(custvo.getZip_code());
			// 신규면 채번

		}
		if (sale_num.equals("x")) {
			// salenum = saleService.getSaleNum("OT");
			salenum = saleService.getSaleNum(unm_f.substring(0, 1) + unm_l.substring(0, 1));
		}
		// System.out.print(salevo.getCust_nm());
		model.addAttribute("salevo", salevo);

		model.addAttribute("salenum", salenum);

		List<ProductVO> pcList = null;
		pcList = pdService.list();
		model.addAttribute("pcList", pcList);

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);
		// System.out.println(spvoList.size());
		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);
		if (salevo != null && salevo.getSale_user_num() != 0) {

			System.out.print(salevo.getSale_user_num());
			UserVO uvo = usService.view(salevo.getSale_user_num());
			model.addAttribute("uvo", uvo);
		}

	}

	@RequestMapping(value = "/other-sales", method = RequestMethod.POST)
	public String postOtherSales(@RequestParam(value = "sale_num", defaultValue = "0") String sale_num, SaleVO svo,
			SaleProdVO spvo) throws Exception {

		String[] sale_nums = sale_num.split(",");
		// sale_num 두개 넘어오는 거 보정
		if (sale_nums.length > 1) {
			sale_num = sale_nums[0];
			svo.setSale_num(sale_num);
		}

		try {
			// svo.setSale_type("onsite");

			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			DateFormat dateFormatT = new SimpleDateFormat("HH:mm:ss");
			dateFormatT.setTimeZone(TimeZone.getTimeZone("CST"));
			String sale_ymd = dateFormatD.format(date);
			String sale_time = dateFormatT.format(date);

			sale_ymd = svo.getSale_ymd();
			String[] symd = sale_ymd.split("/");
			sale_ymd = symd[2] + "-" + symd[1] + "-" + symd[0];

			sale_time = svo.getSale_time() + ":00";

			svo.setSale_ymd(sale_ymd);
			svo.setSale_time(sale_time);
		} catch (Exception e) {
			// 에러시 수행
			System.out.println(e.getMessage());
		}
		// old vo
		SaleVO osvo = saleService.view(sale_num);
		if (osvo != null) {
			svo.setTot_pay_amt(osvo.getTot_pay_amt());
			svo.setLast_pay_ymdt(osvo.getLast_pay_ymdt());
		}

		saleService.delete(sale_num);

		saleService.write(svo);

		spService.deleteAll(sale_num);
		// 모두 지우고 저장
		if (spvo.getSaleProdVOList() != null) {
			for (int i = 0; i < spvo.getSaleProdVOList().size(); i++) {
				// 판매번호 셋팅
				spvo.getSaleProdVOList().get(i).setSale_num(svo.getSale_num());
				// 값이 이중으로 넘어오는 경우 있어 처리함
				String[] sale_opts = spvo.getSaleProdVOList().get(i).getSale_opt().split(",");
				if (sale_opts.length > 1) {
					spvo.getSaleProdVOList().get(i).setSale_opt(sale_opts[0]);
				}

				// System.out.println("sale_qty:"+spvo.getSaleProdVOList().get(i).getSale_qty());
				spService.write(spvo.getSaleProdVOList().get(i));

				// 고객별 최종 판매가 저장
				cuspService.delete(svo.getCust_num(), spvo.getSaleProdVOList().get(i).getPrd_mng_num());

				CustSalePriceVO cspvo = new CustSalePriceVO();
				cspvo.setCust_num(svo.getCust_num());
				cspvo.setPrd_mng_num(spvo.getSaleProdVOList().get(i).getPrd_mng_num());
				cspvo.setSale_price(spvo.getSaleProdVOList().get(i).getSale_price());
				cuspService.write(cspvo);
			}
		}
		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());
		return "redirect:other-sales?sale_num=" + sale_num;
	}

	@RequestMapping(value = "/order-list", method = { RequestMethod.GET, RequestMethod.POST })
	public void getOrderList(Model model, HttpServletRequest req,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws Exception {

		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			return;
		}

		Integer usnum;
		try {
			usnum = uvvo.getUser_num();
		} catch (Exception e1) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(usnum, 214);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and sale_user_num=" + usnum;

		} else {
			strSearch = "";
		}

		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(usnum);
		model.addAttribute("umList", umList);

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			String[] _sale_ymd_s = sale_ymd_s.split("/");
			sale_ymd_s = _sale_ymd_s[2] + "-" + _sale_ymd_s[0] + "-" + _sale_ymd_s[1];
		} else {
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			String sale_ymd = dateFormatD.format(date);
			sale_ymd_s = sale_ymd;
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			String[] _sale_ymd_e = sale_ymd_e.split("/");
			sale_ymd_e = _sale_ymd_e[2] + "-" + _sale_ymd_e[0] + "-" + _sale_ymd_e[1];
		} else {
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			String sale_ymd = dateFormatD.format(date);
			sale_ymd_e = sale_ymd;
		}
		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		model.addAttribute("sale_ymd_s", sale_ymd_s);
		model.addAttribute("sale_ymd_e", sale_ymd_e);
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		List<SaleVO> salelist = null;
		// salelist = saleService.list();
		System.out.print("/order-list strSearch : " + strSearch + "\n");

		salelist = saleService.listByWhere(strSearch + " order by sale_ymd desc, sale_time desc");

		List<SaleProdVO> saleprodlist = null;
		if (salelist.size() > 0) {
			saleprodlist = spService.listBySaleNums(salelist);
		}
		model.addAttribute("saleprodlist", saleprodlist);

		List<SalePayRecVO> salepaylist = null;
		if (salelist.size() > 0) {
			salepaylist = payService.salepaylistBysalenum(salelist);
		}
		model.addAttribute("salepaylist", salepaylist);

		List<UserVO> usList = null;
		usList = usService.list();

		UserVO uv = usList.parallelStream().filter(p -> p.getUser_num() == 1).findAny().get();

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
			}

		}

		model.addAttribute("salelist", salelist);

		if (umvo.getRead_yn().equals("Territory Only")) {
			System.out.print("/order-list strSearch : Territory Only");

		} else {
			List<UserVO> uListC = null;
			uListC = usService.listbyWhere(" and category='commissioner'");
			model.addAttribute("uListC", uListC);
			// System.out.print(uListC.size());

			List<UserVO> uListE = null;
			uListE = usService.listbyWhere(" and category='employee'");
			model.addAttribute("uListE", uListE);

			// System.out.print(uListE.size());

			List<UserVO> uListS = null;
			uListS = usService.listbyWhere(" and category='seller'");
			model.addAttribute("uListS", uListS);
		}

	}

	@RequestMapping(value = "/ar-managment", method = { RequestMethod.GET, RequestMethod.POST })
	public void getArManagment(Model model, HttpServletRequest req,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws Exception {

		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer usnum;
		try {
			usnum = uvvo.getUser_num();
		} catch (Exception e1) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(usnum, 214);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and sale_user_num=" + usnum;

		} else {
			strSearch = "";
		}

		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(usnum);
		model.addAttribute("umList", umList);

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			String[] _sale_ymd_s = sale_ymd_s.split("/");
			sale_ymd_s = _sale_ymd_s[2] + "-" + _sale_ymd_s[0] + "-" + _sale_ymd_s[1];
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			String[] _sale_ymd_e = sale_ymd_e.split("/");
			sale_ymd_e = _sale_ymd_e[2] + "-" + _sale_ymd_e[0] + "-" + _sale_ymd_e[1];
		}
		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		// String strSearch = "";

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		model.addAttribute("sale_ymd_s", sale_ymd_s);
		model.addAttribute("sale_ymd_e", sale_ymd_e);
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		List<SaleVO> salelist = null;
		System.out.print(new Date() + " ar-managment : " + strSearch + "\n");
		salelist = saleService
				.listByWhere(strSearch + " and tot_ord_amt > tot_pay_amt order by sale_ymd asc, sale_time asc");

		List<SaleProdVO> saleprodlist = null;
		if (salelist.size() > 0) {
			saleprodlist = spService.listBySaleNums(salelist);
		}
		model.addAttribute("saleprodlist", saleprodlist);

		List<SalePayRecVO> salepaylist = null;
		if (salelist.size() > 0) {
			salepaylist = payService.salepaylistBysalenum(salelist);
		}
		model.addAttribute("salepaylist", salepaylist);

		List<UserVO> usList = null;
		usList = usService.list();

		UserVO uv = usList.parallelStream().filter(p -> p.getUser_num() == 1).findAny().get();

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			// System.out.print(new Date()+" ar-manager unum : "+ unum+"\n");
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
				// System.out.print(new Date()+" ar-manager unm : NA\n");
			}

		}
		model.addAttribute("salelist", salelist);
		if (umvo.getRead_yn().equals("Territory Only")) {
			System.out.print("/order-list strSearch : Territory Only");

		} else {
			List<UserVO> uListC = null;
			uListC = usService.listbyWhere(" and category='commissioner'");
			model.addAttribute("uListC", uListC);
			// System.out.print(uListC.size());

			List<UserVO> uListE = null;
			uListE = usService.listbyWhere(" and category='employee'");
			model.addAttribute("uListE", uListE);

			// System.out.print(uListE.size());

			List<UserVO> uListS = null;
			uListS = usService.listbyWhere(" and category='seller'");
			model.addAttribute("uListS", uListS);
		}

	}

	@RequestMapping(value = "/ar-managment2", method = { RequestMethod.GET, RequestMethod.POST })
	public void getArManagment2(Model model, HttpServletRequest req,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term,
			@RequestParam(value = "p_size", required = false, defaultValue = "10") int p_size,
			@RequestParam(value = "c_page", required = false, defaultValue = "1") int c_page) throws Exception {

		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer usnum;
		try {
			usnum = uvvo.getUser_num();
		} catch (Exception e1) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(usnum, 214);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and sale_user_num=" + usnum;

		} else {
			strSearch = "";
		}

		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(usnum);
		model.addAttribute("umList", umList);

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			String[] _sale_ymd_s = sale_ymd_s.split("/");
			sale_ymd_s = _sale_ymd_s[2] + "-" + _sale_ymd_s[0] + "-" + _sale_ymd_s[1];
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			String[] _sale_ymd_e = sale_ymd_e.split("/");
			sale_ymd_e = _sale_ymd_e[2] + "-" + _sale_ymd_e[0] + "-" + _sale_ymd_e[1];
		}
		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		// String strSearch = "";

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		model.addAttribute("p_size", p_size);
		model.addAttribute("c_page", c_page);
		model.addAttribute("sale_ymd_s", sale_ymd_s);
		model.addAttribute("sale_ymd_e", sale_ymd_e);
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		System.out.print(new Date() + " ar-managment2 : " + p_size + "\n");

		Page page = new Page();
		// 현제 페이지
		page.setNum(c_page);
		// 한페이지에 출력할 겟수
		page.setPostNum(p_size);
		// 전체 겟수
		page.setCount(saleService.countByWhere(strSearch + " and tot_ord_amt > tot_pay_amt"));

		System.out.print(new Date() + " ar-managment2 : " + p_size + "\n");

		model.addAttribute("page", page);
		model.addAttribute("select", c_page);

		List<SaleVO> salelist = null;
		System.out.print(new Date() + " ar-managment2 : " + strSearch + "\n");
		salelist = saleService
				.listByWhere(strSearch + " and tot_ord_amt > tot_pay_amt order by sale_ymd asc, sale_time asc"
						+ " limit " + page.getDisplayPost() + "," + page.getPostNum());

		List<SaleProdVO> saleprodlist = null;
		if (salelist.size() > 0) {
			saleprodlist = spService.listBySaleNums(salelist);
		}
		model.addAttribute("saleprodlist", saleprodlist);

		List<SalePayRecVO> salepaylist = null;
		if (salelist.size() > 0) {
			salepaylist = payService.salepaylistBysalenum(salelist);
		}
		model.addAttribute("salepaylist", salepaylist);

		List<UserVO> usList = null;
		usList = usService.list();

		UserVO uv = usList.parallelStream().filter(p -> p.getUser_num() == 1).findAny().get();

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			// System.out.print(new Date()+" ar-manager unum : "+ unum+"\n");
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
				// System.out.print(new Date()+" ar-manager unm : NA\n");
			}

		}
		model.addAttribute("salelist", salelist);
		if (umvo.getRead_yn().equals("Territory Only")) {
			System.out.print("/order-list strSearch : Territory Only");

		} else {
			List<UserVO> uListC = null;
			uListC = usService.listbyWhere(" and category='commissioner'");
			model.addAttribute("uListC", uListC);
			// System.out.print(uListC.size());

			List<UserVO> uListE = null;
			uListE = usService.listbyWhere(" and category='employee'");
			model.addAttribute("uListE", uListE);

			// System.out.print(uListE.size());

			List<UserVO> uListS = null;
			uListS = usService.listbyWhere(" and category='seller'");
			model.addAttribute("uListS", uListS);
		}

	}

	@RequestMapping(value = "/sales-close", method = { RequestMethod.GET, RequestMethod.POST })
	public void getSalesClose(Model model, HttpServletRequest req,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws Exception {

		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}

		Integer usnum;
		try {
			usnum = uvvo.getUser_num();
		} catch (Exception e1) {
			model.addAttribute("msg", "You do not have permission! login please.");

			model.addAttribute("url", "/");
			return;
		}
		// System.out.print(unum);
		UserMenuVO umvo = umService.view(usnum, 214);
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("None")) {
			model.addAttribute("msg", "You do not have permission to read.");

			model.addAttribute("url", "/");
			return;

		} else if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and sale_user_num=" + usnum;

		} else {
			strSearch = "";
		}

		model.addAttribute("umvo", umvo);

		List<UserMenuVO> umList = umService.list(usnum);
		model.addAttribute("umList", umList);

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			String[] _sale_ymd_s = sale_ymd_s.split("/");
			sale_ymd_s = _sale_ymd_s[2] + "-" + _sale_ymd_s[0] + "-" + _sale_ymd_s[1];
		} else {
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			String sale_ymd = dateFormatD.format(date);

			sale_ymd_s = sale_ymd;
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			String[] _sale_ymd_e = sale_ymd_e.split("/");
			sale_ymd_e = _sale_ymd_e[2] + "-" + _sale_ymd_e[0] + "-" + _sale_ymd_e[1];
		} else {
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			dateFormatD.setTimeZone(TimeZone.getTimeZone("CST"));
			String sale_ymd = dateFormatD.format(date);

			sale_ymd_e = sale_ymd;
		}
		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		// String strSearch = "";

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}

		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		model.addAttribute("sale_ymd_s", sale_ymd_s);
		model.addAttribute("sale_ymd_e", sale_ymd_e);
		model.addAttribute("search_user", search_user);
		model.addAttribute("filter_by", filter_by);
		model.addAttribute("search_term", search_term);

		List<SaleVO> salelist = null;
		salelist = saleService
				.listByWhere(strSearch + " and tot_ord_amt <= tot_pay_amt order by sale_ymd desc, sale_time desc");

		List<SaleProdVO> saleprodlist = null;
		if (salelist.size() > 0) {
			saleprodlist = spService.listBySaleNums(salelist);
		}
		model.addAttribute("saleprodlist", saleprodlist);

		List<SalePayRecVO> salepaylist = null;
		if (salelist.size() > 0) {
			salepaylist = payService.salepaylistBysalenum(salelist);
		}
		model.addAttribute("salepaylist", salepaylist);

		List<UserVO> usList = null;
		usList = usService.list();

		UserVO uv = usList.parallelStream().filter(p -> p.getUser_num() == 1).findAny().get();

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
			}

		}
		model.addAttribute("salelist", salelist);
		if (umvo.getRead_yn().equals("Territory Only")) {
			System.out.print("/order-list strSearch : Territory Only");

		} else {
			List<UserVO> uListC = null;
			uListC = usService.listbyWhere(" and category='commissioner'");
			model.addAttribute("uListC", uListC);
			// System.out.print(uListC.size());

			List<UserVO> uListE = null;
			uListE = usService.listbyWhere(" and category='employee'");
			model.addAttribute("uListE", uListE);

			// System.out.print(uListE.size());

			List<UserVO> uListS = null;
			uListS = usService.listbyWhere(" and category='seller'");
			model.addAttribute("uListS", uListS);
		}

	}

	@RequestMapping(value = "/ajax-onsite-ar-detail", method = RequestMethod.GET)
	public void getAjaxOnsiteArDetail(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum);
		model.addAttribute("salenum", salenum);

		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);

		model.addAttribute("salevo", salevo);

		UserVO usvo = usService.view(salevo.getSale_user_num());
		model.addAttribute("usvo", usvo);

		String user_nm = usvo.getUser_nm_f() + " " + usvo.getUser_nm_l();
		model.addAttribute("user_nm", user_nm);

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);

		System.out.println(spvoList.size());

		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		SaleFileVO sfvo = sfService.viewBySaleNum(salenum);
		model.addAttribute("sfvo", sfvo);
	}

	@RequestMapping(value = "/ajax-onsite-detail", method = RequestMethod.GET)
	public void getAjaxOnsiteDetail(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum);
		model.addAttribute("salenum", salenum);

		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);

		model.addAttribute("salevo", salevo);

		UserVO usvo = usService.view(salevo.getSale_user_num());
		model.addAttribute("usvo", usvo);
		String user_nm = "";
		try {
			user_nm = usvo.getUser_nm_f() + " " + usvo.getUser_nm_l();
		} catch (Exception e) {

		}

		model.addAttribute("user_nm", user_nm);

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);

		System.out.println(spvoList.size());

		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		SaleFileVO sfvo = sfService.viewBySaleNum(salenum);
		model.addAttribute("sfvo", sfvo);
	}

	@RequestMapping(value = "/ajax-other-detail", method = RequestMethod.GET)
	public void getAjaxOtherDetail(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum);
		model.addAttribute("salenum", salenum);

		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);

		model.addAttribute("salevo", salevo);

		UserVO usvo = usService.view(salevo.getSale_user_num());
		model.addAttribute("usvo", usvo);

		String user_nm = usvo.getUser_nm_f() + " " + usvo.getUser_nm_l();
		model.addAttribute("user_nm", user_nm);

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);

		System.out.println(spvoList.size());

		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		SaleFileVO sfvo = sfService.viewBySaleNum(salenum);
		model.addAttribute("sfvo", sfvo);
	}

	@RequestMapping(value = "/ajax-payment", method = RequestMethod.GET)
	public void getAjaxPayment(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum + "\n");
		model.addAttribute("salenum", salenum);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		System.out.print(payList.size() + "\n");
		model.addAttribute("payList", payList);

	}

	@RequestMapping(value = "/on-site-sales-detail", method = RequestMethod.GET)
	public void getOnsiteDetail(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum);
		model.addAttribute("salenum", salenum);

		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);

		model.addAttribute("salevo", salevo);

		UserVO usvo = usService.view(salevo.getSale_user_num());
		model.addAttribute("usvo", usvo);
		try {
			String user_nm = usvo.getUser_nm_f() + " " + usvo.getUser_nm_l();
			model.addAttribute("user_nm", user_nm);
		} catch (Exception e) {

		}
		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);

		System.out.println(spvoList.size());

		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		SaleFileVO sfvo = sfService.viewBySaleNum(salenum);
		model.addAttribute("sfvo", sfvo);
	}

	@RequestMapping(value = "/other-sales-detail", method = RequestMethod.GET)
	public void getOthersiteDetail(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

		String salenum = sale_num;
		System.out.println(salenum);
		model.addAttribute("salenum", salenum);

		SaleVO salevo = saleService.view(sale_num);
		salevo = saleService.view(sale_num);

		model.addAttribute("salevo", salevo);

		UserVO usvo = usService.view(salevo.getSale_user_num());
		model.addAttribute("usvo", usvo);

		if (usvo != null) {
			String user_nm = usvo.getUser_nm_f() + " " + usvo.getUser_nm_l();
			model.addAttribute("user_nm", user_nm);
		}

		List<SaleProdVO> spvoList = null;
		spvoList = spService.listBySaleNum(salenum);

		model.addAttribute("spvoList", spvoList);

		List<SalePayRecVO> payList = null;
		payList = payService.salepaylist(salenum);
		model.addAttribute("payList", payList);

		SaleFileVO sfvo = sfService.viewBySaleNum(salenum);
		model.addAttribute("sfvo", sfvo);
	}

	@RequestMapping(value = "/upimg/{param}")
	public String getImg(@PathVariable("param") String param) throws Exception {
		System.out.println("/upimg/" + param);
		return "/upimg/" + param;

	}

	@RequestMapping(value = "/invoice-mobile-print", method = RequestMethod.GET)
	public void getInvoiceMobilePrint(@RequestParam("sale_num") String sale_num, Model model) throws Exception {

	}

	@RequestMapping(value = "/sale-prod-add", method = RequestMethod.POST)
	public @ResponseBody ProductVO getSaleProdAdd(@RequestParam(value = "upc_code", defaultValue = "0") String upc_code,
			Model model) throws Exception {
		ProductVO pvo = pdService.viewByUpc(upc_code);
		return pvo;

	}

	@RequestMapping(value = "/sale-prod-add-num", method = RequestMethod.POST)
	public @ResponseBody ProductVO getSaleProdAddNum(
			@RequestParam(value = "prod_num", defaultValue = "0") String prod_num, Model model) throws Exception {
		ProductVO pvo = pdService.view(Integer.parseInt(prod_num));
		return pvo;

	}

	@RequestMapping(value = "/find-cust-sale-price", method = RequestMethod.POST)
	public @ResponseBody CustSalePriceVO getFindCustSalePrice(@RequestParam("cust_num") int cust_num,
			@RequestParam("prd_mng_num") int prd_mng_num, Model model) throws Exception {
		System.out.print(cust_num);
		CustSalePriceVO cspvo = cuspService.view(cust_num, prd_mng_num);
		return cspvo;

	}

	/*
	 * 판매내역 삭제 1.삭제할 내용을 tbl_sale_rec_del로 카피해서 이동 mapper - del_backup 2.삭제 진행
	 * mapper - delete
	 */
	@RequestMapping(value = "/del-sales")
	public @ResponseBody String postDelSales(@RequestParam(value = "sale_num") String sale_num) throws Exception {
		System.out.print("del-sales:" + sale_num);

		try {
			// 삭제전 백업
			saleService.delete_backup(sale_num);
			// 삭제
			saleService.delete(sale_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
		return "ok";

	}

	@RequestMapping(value = "/invoice-mobile-print-write", method = RequestMethod.POST)
	public @ResponseBody String getInvoiceMobilePrintWrite(
			@RequestParam(value = "sale_num", defaultValue = "0") String sale_num, Model model) throws Exception {

		System.out.print(sale_num);
		String fname = "";
		try {
			// 1. 파일 객체 생성
			File file = new File(
					"/usr/local/src/apache-tomcat-9.0.60/webapps/sangja/resources/invoice/" + sale_num + ".prn");

			// 2. 파일 존재여부 체크 및 생성
			if (!file.exists()) {
				file.createNewFile();
			}

			List<SaleProdVO> spvoList = spService.listBySaleNum(sale_num);
			int papersz = spvoList.size() * 136 + 747 + 103;
			String printBody = "CT~~CD,~CC^~CT~\r\n" + "^XA\r\n" + "~TA000\r\n" + "~JSN\r\n" + "^LT0\r\n" + "^MNN\r\n"
					+ "^MTD\r\n" + "^PON\r\n" + "^PMN\r\n" + "^LH0,0\r\n" + "^JMA\r\n" + "^PR5,5\r\n" + "~SD10\r\n"
					+ "^JUS\r\n" + "^LRN\r\n" + "^CI27\r\n" + "^PA0,1,1,0\r\n" + "^XZ\r\n" + "^XA\r\n" + "^MML\r\n"
					+ "^PW799\r\n" + "^LL" + Integer.toString(papersz) + "\r\n" // 용지현재 상품리스트 2 LL1199,상품 리스트1일때 용지 사이즈
																				// : ^LL1039
					+ "^LS0\r\n" + "^FPH,2^FT480,242^A0N,23,23^FH\\^CI28^FDINVOICE #^FS^CI27\r\n"
					+ "^FPH,1^FT7,162^A0N,56,61^FB792,1,14,C^FH\\^CI28^FDINVOICE^FS^CI27\r\n"
					+ "^FT6,290^A0N,25,25^FB793,1,6,C^FH\\^CI28^FDTX EAGLE SUPPLY^FS^CI27\r\n"
					+ "^FT6,321^A0N,25,25^FB793,1,6,C^FH\\^CI28^FD2051 W WALNUT HILL LN^FS^CI27\r\n"
					+ "^FT6,352^A0N,25,25^FB793,1,6,C^FH\\^CI28^FDIRVING, TX 75038^FS^CI27\r\n"
					+ "^FT6,383^A0N,25,25^FB793,1,6,C^FH\\^CI28^FD972-600-8443^FS^CI27"
					+ "^FT21,453^A0N,23,23^FH\\^CI28^FDCUTOMER^FS^CI27\r\n"
					+ "^FPH,2^FT480,209^A0N,23,25^FH\\^CI28^FDDATE^FS^CI27\r\n"
					+ "^FT21,490^A0N,23,23^FH\\^CI28^FDADDRESS^FS^CI27\r\n"
					+ "^FO8,616^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n"
					+ "^FT286,597^A0N,20,20^FH\\^CI28^FDITEM^FS^CI27\r\n"
					+ "^FT517,597^A0N,20,20^FH\\^CI28^FDQTY^FS^CI27\r\n"
					+ "^FT0,597^A0N,20,20^FB648,1,5,R^FH\\^CI28^FDPRICE^FS^CI27\r\n"
					+ "^FT703,597^A0N,20,20^FH\\^CI28^FDAMOUNT^FS^CI27\r\n"
					+ "^FT11,597^A0N,20,20^FH\\^CI28^FDSALES OPTION^FS^CI27\r\n"
					+ "^FO8,568^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n";

			// 판매 정보
			SaleVO svo = saleService.view(sale_num);
			// 이름
			printBody = printBody + "^FT131,453^A0N,23,23^FH\\^CI28^FD" + svo.getCust_nm() + "^FS^CI27\r\n";
			// 영수증번호(판매번호
			printBody = printBody + "^FT605,242^A0N,23,25^FH\\^CI28^FD" + svo.getSale_num() + "^FS^CI27\r\n";

			// 문자열 -> Date
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date sale_date1 = formatter.parse(svo.getSale_ymd());
			System.out.print(sale_date1);
			// date -> 문자열
			SimpleDateFormat formatter2 = new SimpleDateFormat("MM-dd-yyyy");
			String sale_date2 = formatter2.format(sale_date1);
			System.out.print(sale_date2);
			// 날짜
			printBody = printBody + "^FT605,209^A0N,23,23^FH\\^CI28^FD" + sale_date2 + "^FS^CI27\r\n";
			// 주소
			printBody = printBody + "^FT131,490^A0N,23,23^FH\\^CI28^FD" + svo.getAddr() + "^FS^CI27\r\n";
			// city,state,zipcode
			printBody = printBody + "^FT131,519^A0N,23,23^FH\\^CI28^FD" + svo.getCity() + " " + svo.getState() + " "
					+ svo.getZip_code() + "^FS^CI27\r\n";

			// 판매상품
			// 미국달러
			Currency usd = java.util.Currency.getInstance("USD");
			// 화페포멧
			NumberFormat usd_format = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
			usd_format.setCurrency(usd);
			int yAlias = 747;

			for (int i = 0; i < spvoList.size(); i++) {
				// 옵션
				printBody = printBody + "^FT13," + Integer.toString(yAlias) + "^A0N,20,20^FH\\^CI28^FD"
						+ spvoList.get(i).getSale_opt() + "^FS^CI27\r\n";
				// 상품영
				printBody = printBody + "^FT177," + Integer.toString(yAlias) + "^A0N,20,20^FH\\^CI28^FD"
						+ spvoList.get(i).getPrd_nm() + "^FS^CI27\r\n";
				// qty
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB555,1,5,R^FH\\^CI28^FD"
						+ spvoList.get(i).getSale_qty() + "^FS^CI27\r\n";
				// 단가
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB657,1,5,R^FH\\^CI28^FD"
						+ usd_format.format(spvoList.get(i).getSale_price()) + "^FS^CI27\r\n";
				// Amount
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB786,1,5,R^FH\\^CI28^FD"
						+ usd_format.format(spvoList.get(i).getTot_sale_price()) + "^FS^CI27\r\n";
				yAlias = yAlias + 136;
			}
			printBody = printBody + "^FO8," + Integer.toString(yAlias - 110)
					+ "^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n";
			// 할인추가
			printBody = printBody + "^FT440," + Integer.toString(yAlias - 80)
					+ "^A0N,25,25^FH\\^CI28^FDDISCOUNT^FS^CI27\r\n";
			printBody = printBody + "^FT660," + Integer.toString(yAlias - 80) + "^A0N,25,25^FH\\^CI28^FD"
					+ usd_format.format(svo.getDiscount_amt()) + "^FS^CI27\r\n";
			printBody = printBody + "^FT440," + Integer.toString(yAlias - 50)
					+ "^A0N,25,25^FH\\^CI28^FDTOTAL^FS^CI27\r\n";
			printBody = printBody + "^FT660," + Integer.toString(yAlias - 50) + "^A0N,25,25^FH\\^CI28^FD"
					+ usd_format.format(svo.getTot_ord_amt()) + "^FS^CI27\r\n";
			printBody = printBody + "^FT24," + Integer.toString(yAlias + 80)
					+ "^A0N,28,28^FH\\^CI28^FDSignature^FS^CI27\r\n";
			printBody = printBody + "^FO160," + Integer.toString(yAlias + 83) + "^GB631,0,2^FS\r\n";

			yAlias = 680;
			for (int i = 0; i < spvoList.size(); i++) {
				// 바코드 좌표
				printBody = printBody + "^BY2,2,41^FT214," + Integer.toString(yAlias) + "^BUN,,Y,N,Y\r\n";
				// 바코드upc
				printBody = printBody + "^FH\\^FD" + spvoList.get(i).getUpc_code() + "^FS\r\n";
				yAlias = yAlias + 136;
			}
			printBody = printBody + "^PQ1,0,1,Y\r\n" + "^XZ\r\n";

			// 3. Buffer를 사용해서 File에 write할 수 있는 BufferedWriter 생성
			FileWriter fw = new FileWriter(file);
			BufferedWriter writer = new BufferedWriter(fw);
			// 4. 파일에 쓰기
			writer.write(printBody);
			// 5. BufferedWriter close
			writer.close();
			fname = file.getName();
		} catch (IOException e) {
			e.printStackTrace();
			fname = "";
		}

		return fname;
	}

	@RequestMapping(value = "/invoice-mobile-print-write_b20221005", method = RequestMethod.POST)
	public @ResponseBody String getInvoiceMobilePrintWriteB20221005(
			@RequestParam(value = "sale_num", defaultValue = "0") String sale_num, Model model) throws Exception {

		System.out.print(sale_num);
		String fname = "";
		try {
			// 1. 파일 객체 생성
			File file = new File(
					"/usr/local/src/apache-tomcat-9.0.60/webapps/sangja/resources/invoice/" + sale_num + ".prn");

			// 2. 파일 존재여부 체크 및 생성
			if (!file.exists()) {
				file.createNewFile();
			}

			List<SaleProdVO> spvoList = spService.listBySaleNum(sale_num);
			int papersz = spvoList.size() * 136 + 747 + 103;
			String printBody = "CT~~CD,~CC^~CT~\r\n" + "^XA\r\n" + "~TA000\r\n" + "~JSN\r\n" + "^LT0\r\n" + "^MNN\r\n"
					+ "^MTD\r\n" + "^PON\r\n" + "^PMN\r\n" + "^LH0,0\r\n" + "^JMA\r\n" + "^PR5,5\r\n" + "~SD10\r\n"
					+ "^JUS\r\n" + "^LRN\r\n" + "^CI27\r\n" + "^PA0,1,1,0\r\n" + "^XZ\r\n" + "^XA\r\n" + "^MML\r\n"
					+ "^PW799\r\n" + "^LL" + Integer.toString(papersz) + "\r\n" // 용지현재 상품리스트 2 LL1199,상품 리스트1일때 용지 사이즈
																				// : ^LL1039
					+ "^LS0\r\n" + "^FPH,2^FT480,242^A0N,23,23^FH\\^CI28^FDINVOICE #^FS^CI27\r\n"
					+ "^FPH,1^FT7,162^A0N,56,61^FB792,1,14,C^FH\\^CI28^FDINVOICE^FS^CI27\r\n"
					+ "^FT6,290^A0N,25,25^FB793,1,6,C^FH\\^CI28^FDTX EAGLE SUPPLY^FS^CI27\r\n"
					+ "^FT6,321^A0N,25,25^FB793,1,6,C^FH\\^CI28^FD2051 W WALNUT HILL LN^FS^CI27\r\n"
					+ "^FT6,352^A0N,25,25^FB793,1,6,C^FH\\^CI28^FDIRVING, TX 75038^FS^CI27\r\n"
					+ "^FT6,383^A0N,25,25^FB793,1,6,C^FH\\^CI28^FD972-600-8443^FS^CI27"
					+ "^FT21,453^A0N,23,23^FH\\^CI28^FDCUTOMER^FS^CI27\r\n"
					+ "^FPH,2^FT480,209^A0N,23,25^FH\\^CI28^FDDATE^FS^CI27\r\n"
					+ "^FT21,490^A0N,23,23^FH\\^CI28^FDADDRESS^FS^CI27\r\n"
					+ "^FO8,616^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n"
					+ "^FT286,597^A0N,20,20^FH\\^CI28^FDITEM^FS^CI27\r\n"
					+ "^FT517,597^A0N,20,20^FH\\^CI28^FDQTY^FS^CI27\r\n"
					+ "^FT0,597^A0N,20,20^FB648,1,5,R^FH\\^CI28^FDPRICE^FS^CI27\r\n"
					+ "^FT703,597^A0N,20,20^FH\\^CI28^FDAMOUNT^FS^CI27\r\n"
					+ "^FT11,597^A0N,20,20^FH\\^CI28^FDSALES OPTION^FS^CI27\r\n"
					+ "^FO8,568^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n";

			// 판매 정보
			SaleVO svo = saleService.view(sale_num);
			// 이름
			printBody = printBody + "^FT131,453^A0N,23,23^FH\\^CI28^FD" + svo.getCust_nm() + "^FS^CI27\r\n";
			// 영수증번호(판매번호
			printBody = printBody + "^FT605,242^A0N,23,25^FH\\^CI28^FD" + svo.getSale_num() + "^FS^CI27\r\n";

			// 문자열 -> Date
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date sale_date1 = formatter.parse(svo.getSale_ymd());
			System.out.print(sale_date1);
			// date -> 문자열
			SimpleDateFormat formatter2 = new SimpleDateFormat("MM-dd-yyyy");
			String sale_date2 = formatter2.format(sale_date1);
			System.out.print(sale_date2);
			// 날짜
			printBody = printBody + "^FT605,209^A0N,23,23^FH\\^CI28^FD" + sale_date2 + "^FS^CI27\r\n";
			// 주소
			printBody = printBody + "^FT131,490^A0N,23,23^FH\\^CI28^FD" + svo.getAddr() + "^FS^CI27\r\n";
			// city,state,zipcode
			printBody = printBody + "^FT131,519^A0N,23,23^FH\\^CI28^FD" + svo.getCity() + " " + svo.getState() + " "
					+ svo.getZip_code() + "^FS^CI27\r\n";

			// 판매상품
			// 미국달러
			Currency usd = java.util.Currency.getInstance("USD");
			// 화페포멧
			NumberFormat usd_format = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
			usd_format.setCurrency(usd);
			int yAlias = 747;

			for (int i = 0; i < spvoList.size(); i++) {
				// 옵션
				printBody = printBody + "^FT13," + Integer.toString(yAlias) + "^A0N,20,20^FH\\^CI28^FD"
						+ spvoList.get(i).getSale_opt() + "^FS^CI27\r\n";
				// 상품영
				printBody = printBody + "^FT177," + Integer.toString(yAlias) + "^A0N,20,20^FH\\^CI28^FD"
						+ spvoList.get(i).getPrd_nm() + "^FS^CI27\r\n";
				// qty
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB555,1,5,R^FH\\^CI28^FD"
						+ spvoList.get(i).getSale_qty() + "^FS^CI27\r\n";
				// 단가
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB657,1,5,R^FH\\^CI28^FD"
						+ usd_format.format(spvoList.get(i).getSale_price()) + "^FS^CI27\r\n";
				// Amount
				printBody = printBody + "^FT0," + Integer.toString(yAlias) + "^A0N,20,20^FB786,1,5,R^FH\\^CI28^FD"
						+ usd_format.format(spvoList.get(i).getTot_sale_price()) + "^FS^CI27\r\n";
				yAlias = yAlias + 136;
			}
			printBody = printBody + "^FO8," + Integer.toString(yAlias - 110)
					+ "^GFA,33,200,100,:Z64:eJw7b/P5PG0RAwONLQDbAQB3sYGX:EB2D\r\n";
			printBody = printBody + "^FT440," + Integer.toString(yAlias - 80)
					+ "^A0N,25,25^FH\\^CI28^FDTOTAL^FS^CI27\r\n";
			printBody = printBody + "^FT660," + Integer.toString(yAlias - 80) + "^A0N,25,25^FH\\^CI28^FD"
					+ usd_format.format(svo.getTot_sale_amt()) + "^FS^CI27\r\n";
			printBody = printBody + "^FT24," + Integer.toString(yAlias + 50)
					+ "^A0N,28,28^FH\\^CI28^FDSignature^FS^CI27\r\n";
			printBody = printBody + "^FO160," + Integer.toString(yAlias + 53) + "^GB631,0,2^FS\r\n";

			yAlias = 680;
			for (int i = 0; i < spvoList.size(); i++) {
				// 바코드 좌표
				printBody = printBody + "^BY2,2,41^FT214," + Integer.toString(yAlias) + "^BUN,,Y,N,Y\r\n";
				// 바코드upc
				printBody = printBody + "^FH\\^FD" + spvoList.get(i).getUpc_code() + "^FS\r\n";
				yAlias = yAlias + 136;
			}
			printBody = printBody + "^PQ1,0,1,Y\r\n" + "^XZ\r\n";

			// 3. Buffer를 사용해서 File에 write할 수 있는 BufferedWriter 생성
			FileWriter fw = new FileWriter(file);
			BufferedWriter writer = new BufferedWriter(fw);
			// 4. 파일에 쓰기
			writer.write(printBody);
			// 5. BufferedWriter close
			writer.close();
			fname = file.getName();
		} catch (IOException e) {
			e.printStackTrace();
			fname = "";
		}

		return fname;
	}

	@GetMapping("/invoice-download")
	public void download(HttpServletResponse response, HttpServletRequest request, @RequestParam String fname)
			throws Exception {

		String path = "/usr/local/src/apache-tomcat-9.0.60/webapps/sangja/resources/invoice/" + fname; // full경로
		String fileName = fname;// paramMap.get("fileName"); //파일명

		File file = new File(path);

		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {// 브라우저 확인 파일명
																										// encode

				downName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

			} else {

				downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

			}

			response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\"");
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");

			fileInputStream = new FileInputStream(file);
			servletOutputStream = response.getOutputStream();

			byte b[] = new byte[1024];
			int data = 0;

			while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {

				servletOutputStream.write(b, 0, data);

			}

			servletOutputStream.flush();// 출력

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (servletOutputStream != null) {
				try {
					servletOutputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fileInputStream != null) {
				try {
					fileInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "/contract/fileDownload")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request,
			@RequestParam Map<String, String> paramMap) {

		String path = paramMap.get("filePath"); // full경로
		String fileName = paramMap.get("fileName"); // 파일명

		File file = new File(path);

		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {// 브라우저 확인 파일명
																										// encode

				downName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

			} else {

				downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

			}

			response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\"");
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");

			fileInputStream = new FileInputStream(file);
			servletOutputStream = response.getOutputStream();

			byte b[] = new byte[1024];
			int data = 0;

			while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {

				servletOutputStream.write(b, 0, data);

			}

			servletOutputStream.flush();// 출력

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (servletOutputStream != null) {
				try {
					servletOutputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fileInputStream != null) {
				try {
					fileInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "/packing-list-setting", method = RequestMethod.GET)
	public void getPackingListSetting(@RequestParam String sale_num, Model model) throws Exception {

		/*
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
		 * System.out.println("** 국제 표준 시간 **"); System.out.println(new
		 * Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		 * System.out.println("** 한국 시간 **"); System.out.println(new Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC-06"));
		 * System.out.println("** 미국 중부 시간 **"); System.out.println(new
		 * Date().toString());
		 */

		// PrintWriter writer = null;
		System.out.print(sale_num + "\r\n");
		/*
		 * if (sale_num.equals(null)) { writer = response.getWriter();
		 * 
		 * writer.
		 * println("<script>alert('sale number not exist.'); location.href='order-list';</script>"
		 * ); }
		 */
		String editMode = "new";
		PackingVO pkvo = null;
		List<PackingProductVO> pkpvoList = null;
		pkvo = pkService.view(sale_num);
		pkpvoList = pkpService.listByWhere(" and sale_num='" + sale_num + "'");
		// 고객정보
		CustomerVO custvo = null;
		// 팻킹 기본정보
		if (pkvo == null) {
			System.out.print("pkvo: is null\r\n");
			editMode = "new";
			SaleVO svo = null;
			svo = saleService.view(sale_num);
			pkvo = new PackingVO();
			pkvo.setSale_num(svo.getSale_num());
			pkvo.setCust_num(svo.getCust_num());
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			String pack_date = dateFormatD.format(date);
			pkvo.setPack_date(pack_date);

			custvo = cuService.view(svo.getCust_num());
			pkvo.setBill_title("SAS WHOLE SALE");
			pkvo.setBill_addr1(custvo.getAddr());
			pkvo.setBill_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());
			pkvo.setShip_title("SAS WHOLE SALE");
			pkvo.setShip_addr1(custvo.getAddr());
			pkvo.setShip_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());

		} else {
			editMode = "modify";
			System.out.print("pkvo: not null\r\n");
			System.out.print(pkvo.getInvoice_no() + "\r\n");

		}
		List<ProductVO> pdList = null;
		pdList = pdService.list();

		// 상품정보
		if (pkpvoList.size() == 0) {

			List<SaleProdVO> spList = null;
			spList = spService.listBySaleNum(sale_num);

			for (int i = 0; i < spList.size(); i++) {
				PackingProductVO _pkvo = new PackingProductVO();
				int _prd_mng_num = spList.get(i).getPrd_mng_num();
				_pkvo.setSale_num(sale_num);
				_pkvo.setPrd_mng_num(_prd_mng_num);

				ProductVO _pdvo = pdList.parallelStream().filter(p -> p.getPrd_mng_num() == _prd_mng_num).findAny()
						.get();
				if (_pdvo != null) {
					_pkvo.setPrd_nm(_pdvo.getPrd_nm());
				}
				_pkvo.setSale_qty(spList.get(i).getSale_qty());
				_pkvo.setQty_per_box(spList.get(i).getSale_qty());
				_pkvo.setBox_qty(1);

				pkpvoList.add(_pkvo);
			}

		} else {

			for (int i = 0; i < pkpvoList.size(); i++) {
				int _prd_mng_num = pkpvoList.get(i).getPrd_mng_num();
				ProductVO _pdvo = pdList.parallelStream().filter(p -> p.getPrd_mng_num() == _prd_mng_num).findAny()
						.get();
				if (_pdvo != null) {
					pkpvoList.get(i).setPrd_nm(_pdvo.getPrd_nm());
				}
			}
			System.out.print("pkpvoList: not null\r\n");
		}

		custvo = cuService.view(pkvo.getCust_num());
		model.addAttribute("editMode", editMode);
		model.addAttribute("pkvo", pkvo);
		model.addAttribute("pkpvoList", pkpvoList);
		model.addAttribute("custvo", custvo);

	}

	@RequestMapping(value = "/packing-list-setting", method = RequestMethod.POST)
	public String postPackingListSetting(PackingVO pkvo, PackingProductVO pkpdvo) throws Exception {

		pkService.delete(pkvo.getSale_num());
		pkService.write(pkvo);

		// 모두 지우고 저장
		pkpService.delete(pkvo.getSale_num());

		if (pkpdvo.getPackingProductVOList() != null) {
			for (int i = 0; i < pkpdvo.getPackingProductVOList().size(); i++) {
				// 판매번호 셋팅
				pkpdvo.getPackingProductVOList().get(i).setSale_num(pkvo.getSale_num());
				pkpService.write(pkpdvo.getPackingProductVOList().get(i));

			}
		}
		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());

		return "redirect:packing-list-setting?sale_num=" + pkvo.getSale_num();

	}

	@RequestMapping(value = "/packing-list-setting2", method = RequestMethod.POST)
	public @ResponseBody String postPackingListSetting2(@RequestParam String sale_num1, PackingVO pkvo,
			PackingProductVO pkpdvo) throws Exception {

		System.out.println(new Date() + ":" + sale_num1);
		pkvo.setSale_num(sale_num1);

		System.out.println(new Date() + ":" + pkvo.getSale_num());

		pkService.delete(pkvo.getSale_num());
		pkService.write(pkvo);

		// 모두 지우고 저장
		pkpService.delete(pkvo.getSale_num());

		if (pkpdvo.getPackingProductVOList() != null) {
			for (int i = 0; i < pkpdvo.getPackingProductVOList().size(); i++) {
				// 판매번호 셋팅
				pkpdvo.getPackingProductVOList().get(i).setSale_num(pkvo.getSale_num());
				pkpService.write(pkpdvo.getPackingProductVOList().get(i));

			}
		}
		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());
		System.out.println(new Date() + ":" + sale_num1);
		return pkvo.getSale_num();

	}

	@RequestMapping(value = "/invoice-setting", method = RequestMethod.GET)
	public void getInvoiceSetting(@RequestParam String sale_num, Model model) throws Exception {

		/*
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
		 * System.out.println("** 국제 표준 시간 **"); System.out.println(new
		 * Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		 * System.out.println("** 한국 시간 **"); System.out.println(new Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC-06"));
		 * System.out.println("** 미국 중부 시간 **"); System.out.println(new
		 * Date().toString());
		 */

		// PrintWriter writer = null;
		System.out.print(sale_num + "\r\n");
		/*
		 * if (sale_num.equals(null)) { writer = response.getWriter();
		 * 
		 * writer.
		 * println("<script>alert('sale number not exist.'); location.href='order-list';</script>"
		 * ); }
		 */
		
		String editMode = "new";
		InvoiceVO ivvo = null;
		SaleVO svo = null;
		svo = saleService.view(sale_num);
		ivvo = invService.view(sale_num);
        if(svo==null)
        	return;
		// 고객정보
		CustomerVO custvo = null;
		// 팻킹 기본정보
		if (ivvo == null) {
			System.out.print("ivvo: is null\r\n");
			editMode = "new";
			ivvo = new InvoiceVO();
			ivvo.setInvoice_no(svo.getSale_num());
			ivvo.setSale_num(svo.getSale_num());
			ivvo.setCust_num(svo.getCust_num());
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			String invo_date = dateFormatD.format(date);
			ivvo.setInv_date(invo_date);

			custvo = cuService.view(svo.getCust_num());
			ivvo.setBill_title(custvo.getCust_nm());
			ivvo.setBill_addr1(custvo.getAddr());
			ivvo.setBill_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());
			ivvo.setShip_title(custvo.getCust_nm());
			ivvo.setShip_addr1(custvo.getAddr());
			ivvo.setShip_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());
			ivvo.setShip_method(svo.getSale_type());

		} else {
			editMode = "modify";
			System.out.print("pkvo: not null\r\n");
			System.out.print(ivvo.getInvoice_no() + "\r\n");

		}
		List<ProductVO> pdList = null;
		pdList = pdService.list();

		List<SaleProdVO> spList = null;
		spList = spService.listBySaleNum(sale_num);

		for (int i = 0; i < spList.size(); i++) {

			int _prd_mng_num = spList.get(i).getPrd_mng_num();

			ProductVO _pdvo = pdList.parallelStream().filter(p -> p.getPrd_mng_num() == _prd_mng_num).findAny().get();
			if (_pdvo != null) {
				spList.get(i).setPrd_nm(_pdvo.getPrd_nm());
			}

		}
		System.out.print(spList.size() + "\r\n");
		custvo = cuService.view(ivvo.getCust_num());
		model.addAttribute("editMode", editMode);
		model.addAttribute("svo", svo);
		model.addAttribute("ivvo", ivvo);
		model.addAttribute("spList", spList);
		model.addAttribute("custvo", custvo);

	}

	@RequestMapping(value = "/invoice-setting", method = RequestMethod.POST)
	public String postInvoiceSetting(InvoiceVO ivvo) throws Exception {

		invService.delete(ivvo.getSale_num());
		invService.write(ivvo);

		return "redirect:packing-list-setting?sale_num=" + ivvo.getSale_num();

	}

	@RequestMapping(value = "/invoice-setting2", method = RequestMethod.POST)
	public @ResponseBody String postInvociceSetting2(@RequestParam String sale_num1, InvoiceVO ivvo,
			PackingProductVO pkpdvo) throws Exception {

		System.out.println(new Date() + ":" + sale_num1);
		ivvo.setSale_num(sale_num1);

		System.out.println(new Date() + ":" + ivvo.getSale_num());

		invService.delete(ivvo.getSale_num());
		invService.write(ivvo);

		// System.out.println(svo.getSale_num());
		// System.out.println(spvo.getSaleProdVOList().get(0).getPrd_nm());
		// System.out.println(spvo.getSaleProdVOList().get(1).getPrd_nm());
		System.out.println(new Date() + ":" + sale_num1);
		return ivvo.getSale_num();

	}

	@RequestMapping(value = "/print-invoice", method = RequestMethod.GET)
	public void getPrintInvoice(@RequestParam String sale_num, Model model) throws Exception {

		/*
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
		 * System.out.println("** 국제 표준 시간 **"); System.out.println(new
		 * Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		 * System.out.println("** 한국 시간 **"); System.out.println(new Date().toString());
		 * 
		 * TimeZone.setDefault(TimeZone.getTimeZone("UTC-06"));
		 * System.out.println("** 미국 중부 시간 **"); System.out.println(new
		 * Date().toString());
		 */

		// PrintWriter writer = null;
		System.out.print(sale_num + "\r\n");
		/*
		 * if (sale_num.equals(null)) { writer = response.getWriter();
		 * 
		 * writer.
		 * println("<script>alert('sale number not exist.'); location.href='order-list';</script>"
		 * ); }
		 */
		String editMode = "new";
		InvoiceVO ivvo = null;
		SaleVO svo = null;
		svo = saleService.view(sale_num);
		ivvo = invService.view(sale_num);

		// 고객정보
		CustomerVO custvo = null;
		// 팻킹 기본정보
		if (ivvo == null) {
			System.out.print("ivvo: is null\r\n");
			editMode = "new";
			ivvo = new InvoiceVO();
			ivvo.setSale_num(svo.getSale_num());
			ivvo.setCust_num(svo.getCust_num());
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormatD = new SimpleDateFormat("yyyy-MM-dd");
			String invo_date = dateFormatD.format(date);
			ivvo.setInv_date(invo_date);

			custvo = cuService.view(svo.getCust_num());
			ivvo.setBill_title("SAS WHOLE SALE");
			ivvo.setBill_addr1(custvo.getAddr());
			ivvo.setBill_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());
			ivvo.setShip_title("SAS WHOLE SALE");
			ivvo.setShip_addr1(custvo.getAddr());
			ivvo.setShip_addr2(custvo.getCity() + " " + custvo.getState() + " " + custvo.getZip_code());

		} else {
			editMode = "modify";
			System.out.print("pkvo: not null\r\n");
			System.out.print(ivvo.getInvoice_no() + "\r\n");

		}
		List<ProductVO> pdList = null;
		pdList = pdService.list();

		List<SaleProdVO> spList = null;
		spList = spService.listBySaleNum(sale_num);

		for (int i = 0; i < spList.size(); i++) {

			int _prd_mng_num = spList.get(i).getPrd_mng_num();

			ProductVO _pdvo = pdList.parallelStream().filter(p -> p.getPrd_mng_num() == _prd_mng_num).findAny().get();
			if (_pdvo != null) {
				spList.get(i).setPrd_nm(_pdvo.getPrd_nm());
			}

		}
		System.out.print(spList.size() + "\r\n");
		custvo = cuService.view(ivvo.getCust_num());
		model.addAttribute("editMode", editMode);
		model.addAttribute("svo", svo);
		model.addAttribute("ivvo", ivvo);
		model.addAttribute("spList", spList);
		model.addAttribute("custvo", custvo);

	}

	@RequestMapping(value = "/print-packing-list", method = RequestMethod.GET)
	public void getPrintPackingList(@RequestParam(value = "sale_num", defaultValue = "x") String sale_num, Model model)
			throws Exception {
		String editMode = "new";
		PackingVO pkvo = null;
		List<PackingProductVO> pkpvoList = null;
		pkvo = pkService.view(sale_num);
		pkpvoList = pkpService.listByWhere(" and sale_num='" + sale_num + "'");
		// 고객정보
		CustomerVO custvo = null;

		List<ProductVO> pdList = null;
		pdList = pdService.list();

		for (int i = 0; i < pkpvoList.size(); i++) {
			int _prd_mng_num = pkpvoList.get(i).getPrd_mng_num();
			ProductVO _pdvo = pdList.parallelStream().filter(p -> p.getPrd_mng_num() == _prd_mng_num).findAny().get();
			if (_pdvo != null) {
				pkpvoList.get(i).setPrd_nm(_pdvo.getPrd_nm());
			}
			System.out.println(pkpvoList.get(i).getPrd_nm() + "\r\n");
			System.out.println(pkpvoList.get(i).getQty_per_box() + "\r\n");
		}
		custvo = cuService.view(pkvo.getCust_num());
		model.addAttribute("editMode", editMode);
		model.addAttribute("pkvo", pkvo);
		model.addAttribute("pkpvoList", pkpvoList);
		model.addAttribute("custvo", custvo);

	}

	@GetMapping("/excel/order-list")
	public void excelOrderListDownload(HttpServletResponse response, HttpServletRequest req,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws IOException {
//        Workbook wb = new HSSFWorkbook();

		HttpSession session;
		session = req.getSession();
		UserVO uvvo = (UserVO) session.getAttribute("sess_user");
		if (uvvo == null) {
			return;
		}

		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("order list");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// Header
		row = sheet.createRow(rowNum++);

		cell = row.createCell(0);
		cell.setCellValue("#");
		cell = row.createCell(1);
		cell.setCellValue("Date");
		cell = row.createCell(2);
		cell.setCellValue("Sales Person");
		cell = row.createCell(3);
		cell.setCellValue("Name");
		cell = row.createCell(4);
		cell.setCellValue("Address");
		cell = row.createCell(5);
		cell.setCellValue("City");
		cell = row.createCell(6);
		cell.setCellValue("State");
		cell = row.createCell(7);
		cell.setCellValue("Zip Code");
		cell = row.createCell(8);
		cell.setCellValue("Item");
		cell = row.createCell(9);
		cell.setCellValue("Option");
		cell = row.createCell(10);
		cell.setCellValue("Qty");
		cell = row.createCell(11);
		cell.setCellValue("Amount($)");
		cell = row.createCell(12);
		cell.setCellValue("total($)");
		cell = row.createCell(13);
		cell.setCellValue("Payment($)");
		cell = row.createCell(14);
		cell.setCellValue("Balace($)");
		cell = row.createCell(15);
		cell.setCellValue("Type");
		cell = row.createCell(16);
		cell.setCellValue("PayBy");
		cell = row.createCell(17);
		cell.setCellValue("Status");

		/*
		 * if (sale_ymd_s != "" && sale_ymd_s != null) { String[] _sale_ymd_s =
		 * sale_ymd_s.split("/"); sale_ymd_s = _sale_ymd_s[2] + "-" + _sale_ymd_s[0] +
		 * "-" + _sale_ymd_s[1]; } if (sale_ymd_e != "" && sale_ymd_e != null) {
		 * String[] _sale_ymd_e = sale_ymd_e.split("/"); sale_ymd_e = _sale_ymd_e[2] +
		 * "-" + _sale_ymd_e[0] + "-" + _sale_ymd_e[1]; }
		 */
		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		Integer usnum = uvvo.getUser_num();
		// System.out.print(unum);
		UserMenuVO umvo = new UserMenuVO();
		try {
			umvo = umService.view(usnum, 214);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// System.out.print(umvo.getRead_yn());
		String strSearch = "";
		if (umvo.getRead_yn().equals("Territory Only")) {
			strSearch = " and sale_user_num=" + usnum;

		} else {
			strSearch = "";
		}
		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}
		System.out.print("/excel/order-list strSearch : " + strSearch + "\n");
		List<SaleVO> salelist = null;
		try {
			salelist = saleService.listByWhere(strSearch + " order by sale_ymd desc, sale_time desc");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		List<UserVO> usList = null;
		try {
			usList = usService.list();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		UserVO uv = new UserVO();

		double sumTot_ord_amt = 0;
		double sumTot_pay_amt = 0;
		double sumTot_balance = 0;
		int sumTot_qty = 0;

		System.out.print("salelist size : " + salelist.size() + "\n");

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
			}

			row = sheet.createRow(rowNum++);

			cell = row.createCell(0);
			cell.setCellValue(i + 1);

			Date sformat1 = new Date();
			try {
				sformat1 = new SimpleDateFormat("yyyy-MM-dd").parse(salelist.get(i).getSale_ymd());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			String dateToStr = dateFormat.format(sformat1);

			cell = row.createCell(1);
			cell.setCellValue(dateToStr);

			cell = row.createCell(2);
			cell.setCellValue(salelist.get(i).getSale_user_nm());
			cell = row.createCell(3);
			cell.setCellValue(salelist.get(i).getCust_nm());
			cell = row.createCell(4);
			cell.setCellValue(salelist.get(i).getAddr());
			cell = row.createCell(5);
			cell.setCellValue(salelist.get(i).getCity());
			cell = row.createCell(6);
			cell.setCellValue(salelist.get(i).getState());
			cell = row.createCell(7);
			cell.setCellValue(salelist.get(i).getZip_code());

			List<SaleProdVO> saleprodlist = null;
			try {
				saleprodlist = spService.listBySaleNum(salelist.get(i).getSale_num());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			// String Items = "";
			/*
			 * for (int j = 0; j < saleprodlist.size(); j++) { Items = Items +
			 * saleprodlist.get(j).getPrd_nm() + ", " + saleprodlist.get(j).getSale_opt() +
			 * ", " + saleprodlist.get(j).getSale_qty() + "\n"; }
			 */
			// cell = row.createCell(8);
			// cell.setCellValue(Items);
			CellStyle cs = wb.createCellStyle();
			cs.setWrapText(true);

			XSSFCellStyle cs2 = (XSSFCellStyle) wb.createCellStyle();
			XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();
			cs2.setDataFormat(format.getFormat("$#,##0.00"));

			DecimalFormat df = new DecimalFormat("#,##0.00");
			// DecimalFormat df2 = new DecimalFormat("#,##0");
			cell = row.createCell(12);
			cell.setCellStyle(cs2);
			cell.setCellValue(salelist.get(i).getTot_ord_amt());
			sumTot_ord_amt = sumTot_ord_amt + salelist.get(i).getTot_ord_amt();

			cell = row.createCell(13);
			cell.setCellStyle(cs2);
			cell.setCellValue(salelist.get(i).getTot_pay_amt());
			sumTot_pay_amt = sumTot_pay_amt + salelist.get(i).getTot_pay_amt();

			cell = row.createCell(14);
			cell.setCellStyle(cs2);
			cell.setCellValue(salelist.get(i).getTot_ord_amt() - salelist.get(i).getTot_pay_amt());

			cell = row.createCell(15);
			cell.setCellValue(salelist.get(i).getSale_type());

			cell = row.createCell(16);

			List<SalePayRecVO> salepaylist = null;
			try {
				salepaylist = payService.salepaylist(salelist.get(i).getSale_num());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			String Pays = "";
			for (int k = 0; k < salepaylist.size(); k++) {
				if (salepaylist.get(k).getPay_type().equals("check")) {

					Pays = Pays + salepaylist.get(k).getPay_type() + "," + salepaylist.get(k).getCheck_no() + ", "
							+ df.format(salepaylist.get(k).getPay_amt()) + "\n)";
				} else {
					Pays = Pays + salepaylist.get(k).getPay_type() + ", " + df.format(salepaylist.get(k).getPay_amt())
							+ "\n";
				}
			}

			cell.setCellValue(Pays);
			// cell.setCellStyle(cs);

			cell = row.createCell(17);
			String pStatus = "";
			if (salelist.get(i).getTot_sale_amt() <= salelist.get(i).getTot_pay_amt()) {
				pStatus = "Completed";
			} else {
				pStatus = "Pending payment";
			}
			cell.setCellValue(pStatus);
			// 상품
			for (int j = 0; j < saleprodlist.size(); j++) {
				// Items = saleprodlist.get(j).getPrd_nm() + ", " +
				// saleprodlist.get(j).getSale_opt() + ", "
				// + saleprodlist.get(j).getSale_qty();
				if (j == 0) {
					cell = row.createCell(8);
					cell.setCellValue(saleprodlist.get(j).getPrd_nm());
					cell = row.createCell(9);
					cell.setCellValue(saleprodlist.get(j).getSale_opt());
					cell = row.createCell(10);
					cell.setCellValue(saleprodlist.get(j).getSale_qty());
					cell = row.createCell(11);
					cell.setCellStyle(cs2);
					cell.setCellValue(saleprodlist.get(j).getTot_sale_price());
				} else {
					row = sheet.createRow(rowNum++);
					cell = row.createCell(8);
					cell.setCellValue(saleprodlist.get(j).getPrd_nm());
					cell = row.createCell(9);
					cell.setCellValue(saleprodlist.get(j).getSale_opt());
					cell = row.createCell(10);
					cell.setCellValue(saleprodlist.get(j).getSale_qty());
					cell = row.createCell(11);
					cell.setCellStyle(cs2);
					cell.setCellValue(saleprodlist.get(j).getTot_sale_price());
				}
				try {
					sumTot_qty = sumTot_qty + saleprodlist.get(j).getSale_qty();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		// Total
		sumTot_balance = sumTot_ord_amt - sumTot_pay_amt;

		XSSFCellStyle cs2 = (XSSFCellStyle) wb.createCellStyle();
		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();
		cs2.setDataFormat(format.getFormat("$#,##0.00"));

		// DecimalFormat df = new DecimalFormat("#,##0.00");
		// DecimalFormat df2 = new DecimalFormat("#,##0");
		row = sheet.createRow(rowNum++);

		cell = row.createCell(9);
		cell.setCellValue("Tatal");

		cell = row.createCell(10);
		cell.setCellValue(sumTot_qty);

		cell = row.createCell(12);
		cell.setCellStyle(cs2);
		cell.setCellValue(sumTot_ord_amt);

		cell = row.createCell(13);
		cell.setCellStyle(cs2);
		cell.setCellValue(sumTot_pay_amt);

		cell = row.createCell(14);
		cell.setCellStyle(cs2);
		cell.setCellValue(sumTot_balance);

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=order-list.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}

	@GetMapping("/excel/ar-managment")
	public void excelArMenagmentDownload(HttpServletResponse response,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws IOException {
//        Workbook wb = new HSSFWorkbook();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("order list");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// Header
		row = sheet.createRow(rowNum++);

		cell = row.createCell(0);
		cell.setCellValue("#");
		cell = row.createCell(1);
		cell.setCellValue("Date");
		cell = row.createCell(2);
		cell.setCellValue("Sales Person");
		cell = row.createCell(3);
		cell.setCellValue("Name");
		cell = row.createCell(4);
		cell.setCellValue("Address");
		cell = row.createCell(5);
		cell.setCellValue("City");
		cell = row.createCell(6);
		cell.setCellValue("State");
		cell = row.createCell(7);
		cell.setCellValue("Zip Code");
		cell = row.createCell(8);
		cell.setCellValue("Total Cost($)");
		cell = row.createCell(9);
		cell.setCellValue("Payment($)");
		cell = row.createCell(10);
		cell.setCellValue("Balance($)");
		cell = row.createCell(11);
		cell.setCellValue("Over Due(Days)");

		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		String strSearch = "";

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		List<SaleVO> salelist = null;
		try {
			salelist = saleService
					.listByWhere(strSearch + " and tot_ord_amt > tot_pay_amt  order by sale_ymd asc, sale_time asc");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		List<UserVO> usList = null;
		try {
			usList = usService.list();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		UserVO uv = new UserVO();

		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
			}

			row = sheet.createRow(rowNum++);

			cell = row.createCell(0);
			cell.setCellValue(i + 1);

			Date sformat1 = new Date();
			try {
				sformat1 = new SimpleDateFormat("yyyy-MM-dd").parse(salelist.get(i).getSale_ymd());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			String dateToStr = dateFormat.format(sformat1);

			cell = row.createCell(1);
			cell.setCellValue(dateToStr);
			cell = row.createCell(2);
			cell.setCellValue(salelist.get(i).getSale_user_nm());
			cell = row.createCell(3);
			cell.setCellValue(salelist.get(i).getCust_nm());
			cell = row.createCell(4);
			cell.setCellValue(salelist.get(i).getAddr());
			cell = row.createCell(5);
			cell.setCellValue(salelist.get(i).getCity());
			cell = row.createCell(6);
			cell.setCellValue(salelist.get(i).getState());
			cell = row.createCell(7);
			cell.setCellValue(salelist.get(i).getZip_code());

			DecimalFormat df = new DecimalFormat("#,##0.00");
			cell = row.createCell(8);
			cell.setCellValue(df.format(salelist.get(i).getTot_ord_amt()));
			cell = row.createCell(9);
			cell.setCellValue(df.format(salelist.get(i).getTot_pay_amt()));
			cell = row.createCell(10);
			cell.setCellValue(df.format(salelist.get(i).getTot_ord_amt() - salelist.get(i).getTot_pay_amt()));

			Date format1 = new Date();
			try {
				format1 = new SimpleDateFormat("yyyy-MM-dd").parse(salelist.get(i).getSale_ymd());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date format2 = new Date();

			long diffSec = (format2.getTime() - format1.getTime()) / 1000; // 초 차이

			long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

			if (salelist.get(i).getTot_sale_amt() <= salelist.get(i).getTot_pay_amt()) {
				diffDays = 0;
			}

			cell = row.createCell(11);
			cell.setCellValue(diffDays + 1);

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=ar-managment.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}

	@GetMapping("/excel/sale-close")
	public void excelSaleCloseDownload(HttpServletResponse response,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws IOException {
//        Workbook wb = new HSSFWorkbook();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("order list");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// Header
		row = sheet.createRow(rowNum++);

		cell = row.createCell(0);
		cell.setCellValue("#");
		cell = row.createCell(1);
		cell.setCellValue("Date");
		cell = row.createCell(2);
		cell.setCellValue("Sales Person");
		cell = row.createCell(3);
		cell.setCellValue("Name");
		cell = row.createCell(4);
		cell.setCellValue("Address");
		cell = row.createCell(5);
		cell.setCellValue("City");
		cell = row.createCell(6);
		cell.setCellValue("State");
		cell = row.createCell(7);
		cell.setCellValue("Zip Code");
		cell = row.createCell(8);
		cell.setCellValue("Payment($)");
		cell = row.createCell(9);
		cell.setCellValue("PayBy");

		System.out.print("\n" + sale_ymd_s + "\n");
		System.out.print("\n" + sale_ymd_e + "\n");
		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		String strSearch = "";

		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and sale_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			}

			else if (filter_by.equals("sale_status")) {
				if (search_term != "" && search_term != null) {
					if (search_term.toLowerCase().equals("completed")) {
						strSearch = strSearch + " and tot_ord_amt<=tot_pay_amt";
					} else {
						strSearch = strSearch + " and tot_ord_amt>tot_pay_amt";
					}
				}
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		if (sale_ymd_s != "" && sale_ymd_s != null) {
			strSearch = strSearch + " and sale_ymd >= '" + sale_ymd_s + "'";
		}
		if (sale_ymd_e != "" && sale_ymd_e != null) {
			strSearch = strSearch + " and sale_ymd <= '" + sale_ymd_e + "'";
		}

		List<SaleVO> salelist = null;
		try {
			salelist = saleService
					.listByWhere(strSearch + " and tot_ord_amt <= tot_pay_amt order by sale_ymd desc, sale_time desc");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		List<UserVO> usList = null;
		try {
			usList = usService.list();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		UserVO uv = new UserVO();
		double sumTot_pay_amt = 0;
		for (int i = 0; i < salelist.size(); i++) {
			int unum = salelist.get(i).getSale_user_num();
			try {
				uv = usList.parallelStream().filter(p -> p.getUser_num() == unum).findAny().get();
			} catch (Exception e) {
				uv = null;
			}
			if (uv != null) {
				salelist.get(i).setSale_user_nm(uv.getUser_nm_f() + " " + uv.getUser_nm_l());
				// System.out.print(uv.getUser_nm_f() + "\n");
			} else {
				salelist.get(i).setSale_user_nm("N/A");
			}

			row = sheet.createRow(rowNum++);

			cell = row.createCell(0);
			cell.setCellValue(i + 1);

			Date sformat1 = new Date();
			try {
				sformat1 = new SimpleDateFormat("yyyy-MM-dd").parse(salelist.get(i).getSale_ymd());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			String dateToStr = dateFormat.format(sformat1);

			cell = row.createCell(1);
			cell.setCellValue(dateToStr);

			cell = row.createCell(2);
			cell.setCellValue(salelist.get(i).getSale_user_nm());
			cell = row.createCell(3);
			cell.setCellValue(salelist.get(i).getCust_nm());
			cell = row.createCell(4);
			cell.setCellValue(salelist.get(i).getAddr());
			cell = row.createCell(5);
			cell.setCellValue(salelist.get(i).getCity());
			cell = row.createCell(6);
			cell.setCellValue(salelist.get(i).getState());
			cell = row.createCell(7);
			cell.setCellValue(salelist.get(i).getZip_code());

			CellStyle cs = wb.createCellStyle();
			cs.setWrapText(true);

			DecimalFormat df = new DecimalFormat("#,##0.00");

			cell = row.createCell(8);
			cell.setCellValue(df.format(salelist.get(i).getTot_pay_amt()));
			sumTot_pay_amt = sumTot_pay_amt + salelist.get(i).getTot_pay_amt();

			cell = row.createCell(9);
			List<SalePayRecVO> salepaylist = null;
			try {
				salepaylist = payService.salepaylist(salelist.get(i).getSale_num());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String Pays = "";
			for (int k = 0; k < salepaylist.size(); k++) {
				if (salepaylist.get(k).getPay_type().equals("check")) {

					Pays = Pays + salepaylist.get(k).getPay_type() + "," + salepaylist.get(k).getCheck_no() + ", "
							+ df.format(salepaylist.get(k).getPay_amt()) + "\n)";
				} else {
					Pays = Pays + salepaylist.get(k).getPay_type() + ", " + df.format(salepaylist.get(k).getPay_amt())
							+ "\n";
				}
			}

			cell.setCellValue(Pays);
			cell.setCellStyle(cs);
		}

		DecimalFormat df = new DecimalFormat("#,##0.00");
		row = sheet.createRow(rowNum++);

		cell = row.createCell(7);
		cell.setCellValue("Tatal");

		cell = row.createCell(8);
		cell.setCellValue(df.format(sumTot_pay_amt));

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=sale-close.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}

	@GetMapping("/excel/today-visit")
	public void excelTodayVisitDownload(HttpServletResponse response,
			@RequestParam(value = "sale_ymd_s", required = false) String sale_ymd_s,
			@RequestParam(value = "sale_ymd_e", required = false) String sale_ymd_e,
			@RequestParam(value = "search_user", required = false) String search_user,
			@RequestParam(value = "filter_by", required = false) String filter_by,
			@RequestParam(value = "search_term", required = false) String search_term) throws IOException {
//        Workbook wb = new HSSFWorkbook();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("order list");
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
		cell.setCellValue("Last Visit");

		System.out.print("\n" + search_user + "\n");
		System.out.print("\n" + filter_by + "\n");
		System.out.print("\n" + search_term + "\n");

		String strSearch = "";
		if (search_user != "" && search_user != null) {
			strSearch = strSearch + " and mng_user_num in (" + search_user + ")";
		}

		if (filter_by != "" && filter_by != null) {
			if (filter_by.equals("all")) {
				// strSearch = "";
			} else {

				if (search_term != "" && search_term != null) {
					strSearch = strSearch + " and " + filter_by + " like '%" + search_term + "%'";
				}
			}
		}
		strSearch = strSearch + " and cust_status <> 'delete'";

		System.out.print("\n" + strSearch + "\n");
		List<CustomerVO> list = null;
		try {
			list = cuService.listByWhere(strSearch);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

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

			Date sformat1 = new Date();
			try {
				if (list.get(i).getLast_visit_ymd() != null) {
					sformat1 = new SimpleDateFormat("yyyy-MM-dd").parse(list.get(i).getLast_visit_ymd());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

			String dateToStr = "";
			if (list.get(i).getLast_visit_ymd() != null) {

				dateToStr = dateFormat.format(sformat1);

			}

			cell = row.createCell(7);
			cell.setCellValue(dateToStr);

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=today-visit.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
}
