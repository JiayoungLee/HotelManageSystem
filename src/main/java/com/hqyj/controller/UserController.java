package com.hqyj.controller;

import com.hqyj.pojo.Enter1;
import com.hqyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * author  Jayoung
 * createDate  2020/8/3 0003 15:05
 * version 1.0
 */
@Controller
@RequestMapping("uc")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("checkOutPage.do")
    @ResponseBody
    public String checkOutPage(Enter1 enter1) {
        HashMap<String, Object> map = userService.checkOutPage(enter1);
        return "user/checkOutPage";
    }
}
