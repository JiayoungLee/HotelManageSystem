package com.hqyj.service;

import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.Fee1;
import com.hqyj.pojo.House1;

import java.util.HashMap;

public interface Customer1Service {

    //符鸿夷开始----------------------------------

    Customer1 selectByCustomer(int cId);

    int update(Customer1 customer1);

    int updatePassword(Customer1 customer1);


    //符鸿夷结束-----------------------------------

    //李磊开始-------------------------------------

    //查询订单管理分页
    HashMap<String, Object> selectByOrderPage(House1 house);

    //撤销订单
    int cancelOrder(String hName);

    //生成退费清单
    int toForm(Fee1 fee);

    //退费清单
    Fee1 selectFee(Integer enterId);

    int deleteOne(int eId);


    //李磊结束--------------------------------------


    //王福开始----------------------------------------

    //添加客人信息
    int addCustomer(Customer1 customer);

    int editEnterState(Integer eId);


    //王福结束----------------------------------------


}
