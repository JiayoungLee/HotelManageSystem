package com.hqyj.controller;

import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.User1;
import com.hqyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping("toCheckOutPage.do")
    public String toCheckOutPage(){
        return "user/checkOutPage";
    }

    @RequestMapping("checkOutPage.ajax")
    @ResponseBody
    public HashMap<String, Object> checkOutPage(Enter1 enter1, HttpServletRequest request) {
        System.out.println("------------enter1.getPage()--------------"+enter1.getPage()+"------------------");
        User1 user1 = new User1();
        user1.setuId(1);
        user1.setuAccount("xiaoli");
        user1.setuName("小李");
        user1.setuPhone("159****3973");
        user1.setuPassword("123");

        HttpSession session = request.getSession();
        session.setAttribute("user",user1);

        HashMap<String, Object> map = userService.checkOutPage(enter1);

        return map;
    }
}
