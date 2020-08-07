package com.hqyj.service;

import com.hqyj.pojo.Enter1;

import java.util.Map;

/**
 * author  Jayoung
 * createDate  2020/8/7 0007 9:28
 * version 1.0
 */
public interface EnterService {

    //王福开始
    //分页查询
    Map<String, Object> selectEnterInfoByPage(Enter1 enter, Integer hId);

    //查询有多少预约房间
    int selectOrderRoomByeState();

    //通过客户ID(cId)查询房间信息、楼层信息和客户信息，并携带操作员信息，展示到模态框中
    Enter1 selectInfoByCustomerId(Integer getcId);

    //添加客户登记信息
    int updateInfo(Enter1 enter);

    int insertInfo(Enter1 enter);


    //王福结束
}
