package com.hqyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * author  Jayoung
 * createDate  2020/8/3 0003 15:05
 * version 1.0
 */
@Controller
@RequestMapping("uc")
public class UserController {

    @RequestMapping("checkOutPage.do")
    public String checkOutPage(){

        return "user/checkOutPage";
    }
}
