package com.hqyj.dao;

import com.hqyj.pojo.House1;

import java.util.List;

public interface House1Mapper {
    int deleteByPrimaryKey(Integer hId);

    int insert(House1 record);

    int insertSelective(House1 record);

    House1 selectByPrimaryKey(Integer hId);

    int updateByPrimaryKeySelective(House1 record);

    int updateByPrimaryKey(House1 record);

    //陈鸿开始
    List<House1> selectByPage(House1 house1);
    int delAll(List<String> list);
    //陈鸿结束

    //李佳阳开始
    int checkOutHouse(int hId);

    //李佳阳结束

    //李磊开始
    //订单管理分页
    List<House1> selectByOrderPage(House1 house);

    //撤销订单
    int updateByhName(String hName);

    //分页查询所有客房数据
    List<House1> selectAllHouseByPage(House1 house);


    //李磊结束

    //王福开始
    House1 selectHouseById(Integer hId);

    int selectVacantRoom();

    //王福结束

    //王静开始
    List<House1> houseselectByPage(House1 house);


    //王静结束
}
