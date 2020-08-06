package com.hqyj.controller;

import com.hqyj.pojo.Customer1;
import com.hqyj.service.Customer1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * author  Jayoung
 * createDate  2020/8/3 0003 15:06
 * version 1.0
 */
@Controller
@RequestMapping("cc")
public class CustomerController {
    @Autowired
    Customer1Service customer1Service;

    //符鸿夷开始--------------------------------------------
    //跳转到首页
    @RequestMapping("index.do")
    public String index(){
        return "index";
    }

    //跳转到个人信息页面
    @RequestMapping("customerPersom.do")
    public  String customerPersom(ModelMap mm){
        Customer1 list=   customer1Service.selectByCustomer(1);
        System.err.println("list = ========" + list);
        mm.addAttribute("customer1",list);

        return "customer/customerPersonalPage";
    }

    //拿到当前用户信息到修改界面
    @RequestMapping("selectBycId.do")
    public String selectBycId(@RequestParam("cId")int cId, ModelMap mm){
        Customer1 list=  customer1Service.selectByCustomer(cId);
        mm.addAttribute("customer1",list);
        return "customer/modifys";
    }

    //修改个人信息
    @RequestMapping(method = RequestMethod.POST, value = "updateCustomer.do")
    public String updateCustomer(Customer1  customer1,ModelMap mm ){
        if (customer1Service.update(customer1)>0){
            Customer1 list= customer1Service.selectByCustomer(1);
            mm.addAttribute("customer1",list);
            return "redirect:customerPersom.do";
        }else {
            mm.addAttribute("info","修改失败");
        }
        return "customer/modifys";
    }


    //修改个人密码界面
    @RequestMapping("Password.do")
    public String password(@RequestParam("cId")int cId, ModelMap mm){
        Customer1 list=  customer1Service.selectByCustomer(cId);
        mm.addAttribute("customer2",list);
        return "customer/password";
    }

    //修改个人密码操作
    @RequestMapping("updatePassword.do")
    public String updatePassword(Customer1 customer1,ModelMap mm){
        if (customer1Service.updatePassword(customer1)>0){
            Customer1 listmap=  customer1Service.selectByCustomer(1);
            mm.addAttribute("customer1",listmap);
            return "redirect:customerPersom.do";
        }else {
            mm.addAttribute("info","修改失败");
        }
        return  "customer/password";
    }
    //符鸿夷结束------------------------------------------------
}
