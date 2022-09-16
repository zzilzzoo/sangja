package com.sangja.controller;

import java.text.DateFormat;
//import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		
				//DateFormat dateFormatCST = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,TimeZone.getTimeZone("CST"));
		DateFormat dateFormatCST = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,locale);
		dateFormatCST.setTimeZone(TimeZone.getTimeZone("CST"));
		
		String formattedDateCST = dateFormatCST.format(date);
		
		model.addAttribute("serverTimeCST", formattedDateCST);
		
		return "home";
	}
	
	@RequestMapping(value = "/print", method = RequestMethod.GET)
	public void print(Locale locale, Model model) {
		
	}

}
