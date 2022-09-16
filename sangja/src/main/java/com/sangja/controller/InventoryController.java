package com.sangja.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sangja.domain.InventoryInOutVO;
import com.sangja.domain.InventoryUserVO;
import com.sangja.domain.InventoryVO;
import com.sangja.domain.ProductInventoryVO;
import com.sangja.domain.ProductVO;
import com.sangja.domain.UserVO;
import com.sangja.service.InventoryInOutService;
import com.sangja.service.InventoryService;
import com.sangja.service.ProductService;
import com.sangja.service.UserService;

@Controller
public class InventoryController {

	@Inject
	private InventoryService InvService;

	@Inject
	private InventoryInOutService InvioService;

	@Inject
	private ProductService prdService;

	@Inject
	private UserService usService;

	@RequestMapping(value = "/inventory-list", method = RequestMethod.GET)
	public void getInventoryList(Model model) throws Exception {
		List<ProductInventoryVO> prdinvList=null;
		prdinvList=InvService.PrdInvList();
		
		model.addAttribute("prdinvList", prdinvList);
	}

	@RequestMapping(value = "/inventory-detail", method = RequestMethod.GET)
	public void getInventoryDetail(@RequestParam(value = "prd_mng_num", defaultValue = "0") int prd_mng_num,Model model) throws Exception {
		
		ProductVO prdvo=prdService.view(prd_mng_num);
		model.addAttribute("prdvo", prdvo);
		
		List<InventoryUserVO> invUserList=null;
		invUserList=InvioService.InvIOUserList(prd_mng_num);		
		model.addAttribute("invUserList", invUserList);
	}

	
	
	@RequestMapping(value = "/ajax-inventory-storing", method = RequestMethod.GET)
	public void getInventoryStoring(Model model) throws Exception {
		// 제품목록
		List<ProductVO> pdList = null;
		pdList = prdService.list();

		model.addAttribute("pdList", pdList);

		List<UserVO> uListC = null;
		uListC = usService.listbyWhere(" and category='commissioner'");
		model.addAttribute("uListC", uListC);
		System.out.print(uListC.size());

		List<UserVO> uListE = null;
		uListE = usService.listbyWhere(" and category='employee'");
		model.addAttribute("uListE", uListE);

		System.out.print(uListE.size());

		List<UserVO> uListS = null;
		uListS = usService.listbyWhere(" and category='seller'");
		model.addAttribute("uListS", uListS);

	}

	@RequestMapping(value = "/ajax-inventory-storing", method = RequestMethod.POST)
	public String postInventoryStoring(HttpServletRequest request, InventoryInOutVO iviovo) throws Exception {

		String inout_ymdt = request.getParameter("inout_ymdt");
		String event_opt = request.getParameter("event_opt");
		//String user_num1 = request.getParameter("user_num1");
		String event_note1 = request.getParameter("event_note1");
		String user_num2 = request.getParameter("user_num2");
		String event_note2 = request.getParameter("event_note2");
		//String user_num3 = request.getParameter("user_num3");
		String event_note3 = request.getParameter("event_note3");
		String user_num4 = request.getParameter("user_num4");
		String event_note4 = request.getParameter("event_note4");

		int user_num = 0;
		String event_note = "";
		if (event_opt.equals("제품입고")) {
			user_num = 0;
			event_note = event_note1;
		} else if (event_opt.equals("회사입고")) {
			user_num = Integer.parseInt(user_num2);
			event_note = event_note2;
		} else if (event_opt.equals("+ 재고조정")) {
			user_num = 0;
			event_note = event_note3;
		} else if (event_opt.equals("Seller반품입고")) {
			user_num = Integer.parseInt(user_num4);
			event_note = event_note4;
		} else {
			user_num = 0;
			event_note = "";
		}
		System.out.print("날짜:" + inout_ymdt + "\n");
		System.out.print("옵션:" + event_opt + "\n");
		System.out.print("사용자번호:" + user_num + "\n");
		System.out.print("메모:" + event_note + "\n");

		// 회사재고
		InventoryVO invoC = new InventoryVO();
		// 사용자재고
		InventoryVO invoU = new InventoryVO();

		System.out.print("상품수:" + iviovo.getInventoryInOutVOList().size() + "\n");

		if (iviovo.getInventoryInOutVOList() != null) {
			for (int i = 0; i < iviovo.getInventoryInOutVOList().size(); i++) {

				iviovo.getInventoryInOutVOList().get(i).setInout_ymdt(inout_ymdt);
				iviovo.getInventoryInOutVOList().get(i).setEvent_opt(event_opt);
				iviovo.getInventoryInOutVOList().get(i).setUser_num(user_num);
				iviovo.getInventoryInOutVOList().get(i).setEvent_note(event_note);

				System.out.print("상품번호:" + iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num() + "\n");
				System.out.print("event_qty:" + iviovo.getInventoryInOutVOList().get(i).getEvent_qty() + "\n");

				InventoryVO invoCchk = InvService.view(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num(), 0);

				InventoryVO invoUchk = InvService.view(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num(),
						iviovo.getInventoryInOutVOList().get(i).getUser_num());

				String editModeC = "W";
				if (invoCchk == null) {
					editModeC = "W";
				} else {
					editModeC = "M";
				}

				String editModeU = "W";
				if (invoUchk == null) {
					editModeU = "W";
				} else {
					editModeU = "M";
				}

				if (event_opt.equals("제품입고")) {// 회사재고(+)
					// 회사재고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					// 직원재고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty());
					System.out.print("옵션1:\n");

				} else if (event_opt.equals("회사입고")) {// 해당직원재고(-),회사재고(+)
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty()
									- iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					System.out.print("옵션2:\n");
				} else if (event_opt.equals("+ 재고조정")) {// 회사재고(+)
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty());
					System.out.print("옵션3:\n");
				} else if (event_opt.equals("Seller반품입고")) { // 해당직원재고(+) 금액(-)
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty());
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					System.out.print("옵션4:\n");
				} else {
					user_num = 0;
					event_note = "";
					System.out.print("옵션5:\n");
				}

				System.out.print("회사재고후:" + iviovo.getInventoryInOutVOList().get(i).getAf_comp_qty() + "\n");
				System.out.print("사용자재고후:" + iviovo.getInventoryInOutVOList().get(i).getAf_user_qty() + "\n");

				// 토탈
				iviovo.getInventoryInOutVOList().get(i)
						.setTot_qty(iviovo.getInventoryInOutVOList().get(i).getAf_comp_qty()
								+ iviovo.getInventoryInOutVOList().get(i).getAf_user_qty());

				System.out.print("전체수량:" + iviovo.getInventoryInOutVOList().get(i).getTot_qty() + "\n\n\n");

				invoC.setPrd_mng_num(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num());
				invoC.setUser_num(0);
				invoC.setQty(iviovo.getInventoryInOutVOList().get(i).getAf_comp_qty());

				invoU.setPrd_mng_num(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num());
				invoU.setUser_num(user_num);
				invoU.setQty(iviovo.getInventoryInOutVOList().get(i).getAf_user_qty());

				if (user_num == 0) {
					if (editModeC == "W") {
						InvService.write(invoC);
					} else {
						InvService.modify(invoC);
					}
				} else {
					if (editModeC == "W") {
						InvService.write(invoC);
					} else {
						InvService.modify(invoC);
					}

					if (editModeU == "W") {
						InvService.write(invoU);
					} else {
						InvService.modify(invoU);
					}
				}

				InvioService.write(iviovo.getInventoryInOutVOList().get(i));
			}
		}
		return "redirect:inventory-list";

	}

	@RequestMapping(value = "/ajax-inventory-unstoring", method = RequestMethod.GET)
	public void getInventoryUnStoring(Model model) throws Exception {
		// 제품목록
		List<ProductVO> pdList = null;
		pdList = prdService.list();

		model.addAttribute("pdList", pdList);

		List<UserVO> uListC = null;
		uListC = usService.listbyWhere(" and category='commissioner'");
		model.addAttribute("uListC", uListC);
		System.out.print(uListC.size());

		List<UserVO> uListE = null;
		uListE = usService.listbyWhere(" and category='employee'");
		model.addAttribute("uListE", uListE);

		System.out.print(uListE.size());

		List<UserVO> uListS = null;
		uListS = usService.listbyWhere(" and category='seller'");
		model.addAttribute("uListS", uListS);
	}

	@RequestMapping(value = "/ajax-inventory-unstoring", method = RequestMethod.POST)
	public String postInventoryUnStoring(HttpServletRequest request, InventoryInOutVO iviovo) throws Exception {

		String inout_ymdt = request.getParameter("inout_ymdt");
		String event_opt = request.getParameter("event_opt");
		String user_num1 = request.getParameter("user_num1");
		String event_note1 = request.getParameter("event_note1");
		//String user_num2 = request.getParameter("user_num2");
		String event_note2 = request.getParameter("event_note2");
		String user_num3 = request.getParameter("user_num3");
		String event_note3 = request.getParameter("event_note3");
		String user_num4 = request.getParameter("user_num4");
		String event_note4 = request.getParameter("event_note4");

		int user_num = 0;
		String event_note = "";
		if (event_opt.equals("직원출고")) {
			user_num = Integer.parseInt(user_num1);
			event_note = event_note1;
		} else if (event_opt.equals("- 재고조정")) {
			user_num = 0;
			event_note = event_note2;
		} else if (event_opt.equals("Seller판매출고")) {
			user_num = Integer.parseInt(user_num3);
			event_note = event_note3;
		} else if (event_opt.equals("Seller교환")) {
			user_num = Integer.parseInt(user_num4);
			event_note = event_note4;
		} else {
			user_num = 0;
			event_note = "";
		}
		System.out.print(inout_ymdt + "\n");
		System.out.print(event_opt + "\n");
		System.out.print(user_num + "\n");
		System.out.print(event_note + "\n");

		// 회사재고
		InventoryVO invoC = new InventoryVO();
		// 사용자재고
		InventoryVO invoU = new InventoryVO();

		System.out.print(iviovo.getInventoryInOutVOList().size() + "\n");

		if (iviovo.getInventoryInOutVOList() != null) {
			for (int i = 0; i < iviovo.getInventoryInOutVOList().size(); i++) {

				iviovo.getInventoryInOutVOList().get(i).setInout_ymdt(inout_ymdt);
				iviovo.getInventoryInOutVOList().get(i).setEvent_opt(event_opt);
				iviovo.getInventoryInOutVOList().get(i).setUser_num(user_num);
				iviovo.getInventoryInOutVOList().get(i).setEvent_note(event_note);

				System.out.print(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num() + "\n");
				System.out.print(iviovo.getInventoryInOutVOList().get(i).getEvent_qty() + "\n");

				InventoryVO invoCchk = InvService.view(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num(), 0);

				InventoryVO invoUchk = InvService.view(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num(),
						iviovo.getInventoryInOutVOList().get(i).getUser_num());

				String editModeC = "W";
				if (invoCchk == null) {
					editModeC = "W";
				} else {
					editModeC = "M";
				}
				
				String editModeU = "W";
				if (invoUchk == null) {
					editModeU = "W";
				} else {
					editModeU = "M";
				}

				/*
				 * <option>직원출고</option><!-- 회사재고(-),직원재고(+) --> <option>- 재고조정</option><!--
				 * 회사재고(-) --> <option>Seller판매출고</option><!-- 회사재고(-),직원재고(+) -->
				 * <option>Seller교환</option><!-- 재고 변동 없음 -->
				 */

				if (event_opt.equals("직원출고")) {
					// 회사제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									- iviovo.getInventoryInOutVOList().get(i).getEvent_qty());

					// 사용자 제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());

				} else if (event_opt.equals("- 재고조정")) {
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									- iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty());
				} else if (event_opt.equals("Seller판매출고")) {
					// 회사제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty()
									- iviovo.getInventoryInOutVOList().get(i).getEvent_qty());

					// 사용자 제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty()
									+ iviovo.getInventoryInOutVOList().get(i).getEvent_qty());
				} else if (event_opt.equals("Seller교환")) {
					// 회사제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_comp_qty(iviovo.getInventoryInOutVOList().get(i).getBf_comp_qty());

					// 사용자 제고
					iviovo.getInventoryInOutVOList().get(i)
							.setAf_user_qty(iviovo.getInventoryInOutVOList().get(i).getBf_user_qty());
				} else {
					user_num = 0;
					event_note = "";
				}

				// 토탈
				iviovo.getInventoryInOutVOList().get(i)
						.setTot_qty(iviovo.getInventoryInOutVOList().get(i).getAf_comp_qty()
								+ iviovo.getInventoryInOutVOList().get(i).getAf_user_qty());

				invoC.setPrd_mng_num(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num());
				invoC.setQty(iviovo.getInventoryInOutVOList().get(i).getAf_comp_qty());
				invoC.setUser_num(0);

				invoU.setPrd_mng_num(iviovo.getInventoryInOutVOList().get(i).getPrd_mng_num());
				invoU.setUser_num(user_num);
				invoU.setQty(iviovo.getInventoryInOutVOList().get(i).getAf_user_qty());

				if (user_num == 0) {
					if (editModeC == "W") {
						InvService.write(invoC);
					} else {
						InvService.modify(invoC);
					}
				} else {
					if (editModeC == "W") {
						InvService.write(invoC);
					} else {
						InvService.modify(invoC);
					}

					if (editModeU == "W") {
						InvService.write(invoU);
					} else {
						InvService.modify(invoU);
					}
				}

				InvioService.write(iviovo.getInventoryInOutVOList().get(i));
			}
		}
		return "redirect:inventory-list";

	}

	@RequestMapping(value = "/find-inventory-product", method = RequestMethod.POST)
	public @ResponseBody InventoryVO findInventoryProdcut(
			@RequestParam(value = "prd_mng_num", defaultValue = "0") String prd_mng_num,
			@RequestParam(value = "user_num", defaultValue = "0") String user_num) throws Exception {
		InventoryVO vo = new InventoryVO();
		vo = InvService.view(Integer.parseInt(prd_mng_num), Integer.parseInt(user_num));
		System.out.print(user_num + "\n");
		System.out.print(vo.getQty() + "\n");
		return vo;
	}

}
