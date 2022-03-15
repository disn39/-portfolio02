package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MoreinfoController {

	@GetMapping(value = "/moreinfo/CI")
    public String ci(Model model){
        
        return "/moreinfo/CI";
    }
	
	@GetMapping(value = "/moreinfo/doduck")
    public String doduck(Model model){
        
        return "/moreinfo/doduck";
    }
	
	@GetMapping(value = "/moreinfo/guanggo")
    public String guanggo(Model model){
        
        return "/moreinfo/guanggo";
    }
	
	@GetMapping(value = "/moreinfo/hi_CEO")
    public String hi_CEO(Model model){
        
        return "/moreinfo/hi_CEO";
    }
	
	@GetMapping(value = "/moreinfo/intro")
    public String intro(Model model){
        
        return "/moreinfo/intro";
    }
	@GetMapping(value = "/rpa")
    public String rpa(Model model){
        
        return "/rpa/rpa";
    }
}
