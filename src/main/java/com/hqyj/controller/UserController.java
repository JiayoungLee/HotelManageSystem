package com.hqyj.controller;

import com.hqyj.pojo.*;
import com.hqyj.service.Customer1Service;
import com.hqyj.service.EnterService;
import com.hqyj.service.HouseService;
import com.hqyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import java.util.Map;

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

    @Autowired
    private EnterService enterService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private Customer1Service customer1Service;

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

        User1 user1 = userService.selectUserById((Integer) request.getSession().getAttribute("user_id"));

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
        houser1.setCustomerId(0);
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
    public String factorQuery(House1 house1, ModelMap map,String factor,String keywords) {
        if (factor.equals("floorId")){
            house1.setFloorId(Integer.valueOf(keywords));
        }else if (factor.equals("hAmount")){
            if (keywords.equals("大床房")){
                house1.sethAmount(1);
            }else if(keywords.equals("双床房")){
                house1.sethAmount(2);
            }
        }else if (factor.equals("hState")){
            if (keywords.equals("空闲")){
                house1.sethState(1);
            }else if(keywords.equals("已订")){
                house1.sethState(2);
            }else if(keywords.equals("已入住")){
                house1.sethState(3);
            }
        }else if (factor.equals("hName")){
            house1.sethName(keywords);
        }else {

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

    //王福开始--------------------------------------

    /*#############################      预约登记    #####################################*/
    //跳转到入住信息管理页面
    @RequestMapping("enterPage.do")
    public String enterPage(Enter1 enter, Model model, MyPage page, House1 house, HttpServletRequest req){
        Integer hId = house.gethId();//通过hId查询客房
        //分页查询：准备入住信息页面展示的数据
        page.setPage(page.getPage());
        Map<String, Object> map = enterService.selectEnterInfoByPage(enter,hId);


        //查询预约的客房条数
        int num = enterService.selectOrderRoomByeState();
        if(num==0){
            model.addAttribute("msg","当前没有预定的客房！");
        }

        //通过获取存储在session的操作者id查询User对象
        System.out.println("-----------user_id-------------"+req.getSession().getAttribute("user_id"));
        User1 user = userService.selectUserById((Integer)(req.getSession().getAttribute("user_id")));
        model.addAttribute("user",user);

        //把数据传到前端
        model.addAttribute("map",map);
        model.addAttribute("hId",hId);
        return "user/enterPage";
    }

    //ajax请求：查询客户入住信息
    //通过客户ID(cId)查询房间信息、楼层信息和客户信息，并携带操作员信息，展示到模态框中
    @RequestMapping("selectInfoByCustomerId.ajax")
    @ResponseBody
    public Enter1 selectInfoByCustomerId(Customer1 customer){
        return enterService.selectInfoByCustomerId(customer.getcId());
    }

    //ajax请求：编辑客户入住信息
    @RequestMapping(value = "updateInfo.ajax",method = RequestMethod.POST)
    @ResponseBody
    public int updateInfo(Enter1 enter ,House1 house){
        house.sethId(enter.getHouseId());
        house.sethState(3);
        houseService.updatehState(house);
        return enterService.updateInfo(enter);
    }

    /*#############################      预约登记    #####################################*/

    /*#############################      无预约登记    #####################################*/

    //跳转到状态为空闲客房的信息页面
    @RequestMapping("vacantRoomPage.do")
    public String vacantRoomPage(Model model, House1 house, MyPage page, HttpServletRequest req){
        page.setPage(page.getPage());
        //分页查询：查询house表，展示空闲状态的客房
        Map<String, Object> map = houseService.selectAllHouseByPage(house);
        model.addAttribute("map",map);

        //通过获取存储在session的操作者id查询User对象
        User1 user = userService.selectUserById((Integer)(req.getSession().getAttribute("user_id")));
        model.addAttribute("user",user);

        //假设没有空闲的客房，要在前端显示“当前没有空闲的客房”
        int i = houseService.selectVacantRoom();
        if (i==0){
            model.addAttribute("msg","当前没有空闲的客房");
        }

        //得到条件搜索的hAmount的状态
        Integer hAmountState = house.gethAmount();
        model.addAttribute("hAmount",house.gethAmount());
        return "user/housePage";
    }

    //ajax请求：通过hId查询客房信息
    @RequestMapping("selectHouseById.ajax")
    @ResponseBody
    public House1 selectHouseById(House1 house){
        return houseService.selectHouseById(house.gethId());
    }


    //ajax请求：无预约登记客房信息信息
    @RequestMapping("updateEnterHouse.ajax")
    @ResponseBody
    public int updateEnterHouse(Enter1 enter, Customer1 customer, User1 user,House1 house){

        //登记客人信息
        customer1Service.addCustomer(customer);
        Integer cId = customer.getcId();
        Integer uId = user.getuId();
        Integer hId = house.gethId();
        house.sethId(hId);
        //客房信息登记后
        //(1)将house表的状态改变;  1:空闲、2:已订、3:在住
        house.sethState(3);
        houseService.updatehState(house);
        //(2)将enter表的状态改变;  1:预定、2:正在住、3:已退
        enter.seteState(2);
        enter.setCustomerId(cId);//加入客户id
        enter.setHouseId(hId);//加入房间id
        enter.setUserId(uId);//加入操作员id
        return enterService.insertInfo(enter);

    }
    /*#############################      无预约登记    #####################################*/


    //王福结束--------------------------------------
}
