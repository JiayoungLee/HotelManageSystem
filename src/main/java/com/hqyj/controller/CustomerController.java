package com.hqyj.controller;

import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.Fee1;
import com.hqyj.pojo.House1;
import com.hqyj.service.Customer1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

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

    //跳转到个人信息页面
    @RequestMapping("customerPersom.do")
    public  String customerPersom(ModelMap mm ,HttpServletRequest request){
        Integer cId = (Integer) request.getSession().getAttribute("cId");

        Customer1 list=   customer1Service.selectByCustomer(cId);
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
    public String updateCustomer(Customer1  customer1,ModelMap mm ,HttpServletRequest request){
        if (customer1Service.update(customer1)>0){
            Integer cId = (Integer) request.getSession().getAttribute("cId");
            Customer1 list= customer1Service.selectByCustomer(cId);
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
    public String updatePassword(Customer1 customer1,ModelMap mm,HttpServletRequest request){
        if (customer1Service.updatePassword(customer1)>0){
            Integer cId = (Integer) request.getSession().getAttribute("cId");
            Customer1 listmap=  customer1Service.selectByCustomer(cId);
            mm.addAttribute("customer1",listmap);
            return "customer/password";
        }else {
            mm.addAttribute("info","修改失败");
        }
        return  "customer/password";
    }
    //符鸿夷结束------------------------------------------------


    //李磊开始---------------------------------------------------

    //跳转到订单管理
    @RequestMapping("orderPage.do")
    public String orderPage(){
        return "customer/orderPage";
    }

    //跳转到页面订单管理订单详情
    @RequestMapping("orderInfo.do")
    public String orderinfo(int enterId3, ModelMap map) {
        // int enterId = Integer.parseInt(enterId3);
        map.addAttribute("enterId3",enterId3);
        return "customer/orderInfo";
    }

    //ajax请求（订单管理）
    @RequestMapping("order.ajax")
    @ResponseBody
    public HashMap<String,Object> orderPage1(House1 house , HttpServletRequest request){
        //----------------------session给customerId赋值
        //house.setCustomerId(1);
        Integer cId = (Integer) request.getSession().getAttribute("cId");
        house.setCustomerId(cId);
        HashMap map = customer1Service.selectByOrderPage(house);
        return map;
    }

    //撤销订单
    @RequestMapping("cancelOrder.ajax")
    @ResponseBody
    public int cancelOrder(House1 house){
        String hName = house.gethName();
        return customer1Service.cancelOrder(hName);
    }


    //跳转到退订清单页面
    @RequestMapping("fee.do")
    public String fee(int mm, ModelMap map){
        map.addAttribute("enterId3",mm);
        return "customer/feePage";
    }

    //生成退费清单
    @RequestMapping("toForm.ajax")
    @ResponseBody
    public HashMap toForm(Fee1 fee){
        HashMap map = new HashMap();
        if(customer1Service.toForm(fee)>0){
            map.put("info1","生成清单成功");
        }else{
            map.put("info1","生成清单失败");
        }
        return map;
    }

    //展示退费清单
    @RequestMapping("getForm.ajax")
    @ResponseBody
    public Fee1 getForm(Fee1 fee){
        Integer enterId = fee.getEnterId();
        return customer1Service.selectFee(enterId);
    }

    //删除用户
    @RequestMapping("deleteOne.ajax")
    @ResponseBody
    public int deleteOne(Enter1 enter1) {
        int eId = enter1.geteId();
        return customer1Service.deleteOne(eId);
    }

    @RequestMapping("editEnterState.ajax")
    @ResponseBody
    public int editEnterState(Enter1 enter1){
        Integer eId = enter1.geteId();
        return customer1Service.editEnterState(eId);
    }
    //李磊结束---------------------------------------------------
}
