package com.sangja.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sangja.domain.UserVO;
import com.sangja.service.UserService;

@Controller
public class SigninController {

	@Inject
	private UserService usService;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignIn(@RequestParam(value = "return_path", defaultValue = "") String return_path, Model model)
			throws Exception {
		model.addAttribute("return_path", return_path);
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignIn(UserVO vo, HttpServletRequest req, RedirectAttributes rttr,
			@RequestParam(value = "return_path", defaultValue = "") String return_path) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO login = usService.login(vo);
		System.out.print(return_path);
		if (login == null) {
			session.setAttribute("sess_user", null);
			System.out.print("로그인실패");
			rttr.addFlashAttribute("msg", false);
			return "redirect:/signin";
		} else {
			session.setAttribute("sess_user", login);
			session.setMaxInactiveInterval(3600);
			System.out.print("로그인성공");
			
			if (return_path == null) {
				System.out.print("로그인성공1");
				return "redirect:/home";
			} else if (return_path == "") {
				System.out.print("로그인성공2");
				return "redirect:/home";
			} else {
				System.out.print(return_path);
				return "redirect:/" + return_path;
			}

		}

	}

	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String getSignOut(HttpSession session) throws Exception {

		session.invalidate();
		return "redirect:/";
	}
}
