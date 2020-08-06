package com.hqyj.controller;

import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.House1;
import com.hqyj.pojo.User1;
import com.hqyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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

    //李佳阳开始------------------------------
    //跳转到退房界面
    @RequestMapping("toCheckOutPage.do")
    public String toCheckOutPage() {
        return "user/checkOutPage";
    }

    //响应退房界面的ajax请求
    @RequestMapping("checkOutPage.ajax")
    @ResponseBody
    public HashMap<String, Object> checkOutPage(Enter1 enter1, HttpServletRequest request) {
        System.out.println("------------enter1.getPage()--------------" + enter1.getPage() + "------------------");
        User1 user1 = new User1();
        user1.setuId(1);
        user1.setuAccount("xiaoli");
        user1.setuName("小李");
        user1.setuPhone("159****3973");
        user1.setuPassword("123");

        HttpSession session = request.getSession();
        session.setAttribute("user", user1);

        HashMap<String, Object> map = userService.checkOutPage(enter1);

        return map;
    }

    //响应单个已入住房的信息界面ajax
    @RequestMapping(value = "selectLivingDetailByEId.ajax", produces = "application/json;charset=utf-8")
    @ResponseBody
    public HashMap selectLivingDetailByEId(int eId) {
        //System.err.println("-----前端来的eId---"+eId);
        Enter1 enter1 = userService.selectLivingDetailByEId(eId);
        HashMap map = new HashMap();
        System.out.println("-------1、enter--------\n" + enter1);
        map.put("enter1", enter1);
        return map;
    }

    //响应退房操作的ajax
    @RequestMapping(value = "checkOut.ajax", produces = "application/json;charset=utf-8")
    @ResponseBody
    public HashMap checkOut(int eId, int hId, double feeTotal) {
        HashMap map0 = new HashMap();
        map0.put("eId", eId);
        map0.put("feeTotal", feeTotal);
        int i = userService.checkOutEnter(map0, hId);

        HashMap map = new HashMap();
        map.put("info", "退房成功");
        return map;
    }

    //李佳阳结束------------------------------


    //陈鸿开始-----------------------------
    //查看存在的house信息

    @RequestMapping("houseList.do")
    public String list(House1 house1, ModelMap map) {
        System.out.println("-----------------------------" + house1);

        HashMap<String, Object> listMap = userService.selectByPage(house1);
        map.addAttribute("data", listMap);
        //定义返回的页面
        return "user/roomManagerPage";
    }

    //house编辑界面
    @RequestMapping("roomEditPage.do")
    public String roomEditPage(@RequestParam("hId") int hId, ModelMap map) {
        House1 houser1 = userService.selectByHid(hId);
        map.addAttribute("house", houser1);

        return "user/roomEditPage";
    }

    //进行对house的编辑操作
    @RequestMapping(method = RequestMethod.POST, value = "roomEdit.do")
    public String roomEdit(House1 houser1, ModelMap map) {
        if (userService.update(houser1) > 0) {
            //刷新
            House1 houser2 = new House1();
            HashMap<String, Object> listMap = userService.selectByPage(houser2);
            map.addAttribute("data", listMap);
            //redirect:url地址：重定向
            return "redirect:houseList.do";
        } else {
            map.addAttribute("info", "修改失败");
            return "user/roomEditPage";
        }
    }

    //删除house操作
    @RequestMapping("deleteHouse.do")
    public String delete(int hId, ModelMap map) {
        if (userService.delHouse(hId) > 0) {
            //刷新
            House1 house = new House1();
            HashMap<String, Object> listMap = userService.selectByPage(house);
            map.addAttribute("data", listMap);
            //redirect:url地址：重定向
        }
        return "redirect:houseList.do";
    }

    //跳转到添加house界面
    @RequestMapping("roomAddPage.do")
    public String roomAddPage() {
        return "user/roomAddPage";
    }

    //执行addHouse操作
    @RequestMapping(method = RequestMethod.POST, value = "roomAdd.do")
    public String roomAdd(House1 houser1, ModelMap map) {
        if (userService.insertHouse(houser1) > 0) {
            //刷新
            House1 houser2 = new House1();
            HashMap<String, Object> listMap = userService.selectByPage(houser2);
            map.addAttribute("data", listMap);
            //redirect:url地址：重定向
            return "redirect:houseList.do";
        } else {
            map.addAttribute("info", "修改失败");
            return "user/roomAddPage";
        }
    }

    //删除全部house
    @RequestMapping("deleteAll.do")
    public String deleteAll(String allId, ModelMap map) {
        List<String> list = Arrays.asList(allId.split(","));
        if (userService.delAllHouse(list) > 0) {
            //刷新
            House1 house = new House1();
            HashMap<String, Object> listMap = userService.selectByPage(house);
            map.addAttribute("data", listMap);
        }
        return "redirect:houseList.do";
    }

    //条件查询house
    @RequestMapping("factorQuery.do")
    public String factorQuery(House1 house1, ModelMap map, String factor, String keywords) {
        System.out.println("---------------------------factorQuery.do-------------------");
        if (factor.equals("floorId")) {
            house1.setFloorId(Integer.valueOf(keywords));
        } else if (factor.equals("hAmount")) {
            house1.sethAmount(Integer.valueOf(keywords));
        } else if (factor.equals("hState")) {
            house1.sethState(Integer.valueOf(keywords));
        } else if (factor.equals("hName")) {
            house1.sethName(keywords);
        } else {

        }
        System.err.println("---------------------house1--------------------------- = " + house1.toString());
        HashMap<String, Object> listMap = userService.selectByPage(house1);
        map.addAttribute("data", listMap);

        map.addAttribute("factor", factor);
        map.addAttribute("keywords", keywords);

        //定义返回的页面
        return "user/roomManagerPage";
    }

    //陈鸿结束----------------------------
}
