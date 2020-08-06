package com.hqyj.service;

import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.House1;

import java.util.HashMap;
import java.util.List;

/**
 * author  Jayoung
 * createDate  2020/8/3 0003 19:42
 * version 1.0
 */
public interface UserService {
    HashMap<String, Object> checkOutPage(Enter1 enter1);

    Enter1 selectLivingDetailByEId(int eId);

    int checkOutEnter(HashMap map,int hId);

    //陈鸿开始
    HashMap<String, Object> selectByPage(House1 house1);

    House1 selectByHid(int hId);

    int update(House1 houser1);

    int delHouse(int hId);


    int insertHouse(House1 houser1);

    int delAllHouse(List<String> list);


    //陈鸿结束
}
