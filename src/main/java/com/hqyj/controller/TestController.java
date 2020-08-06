package com.hqyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * author  Jayoung
 * createDate  2020/7/27 0027 11:27
 * version 1.0
 */
@Controller
@RequestMapping("tc")
public class TestController {

    //测试shiro
    @RequestMapping("firstShiro.do")
    public String firsShiro(){
        return "user/testIcon";
    }


}
