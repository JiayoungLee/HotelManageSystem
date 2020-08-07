package com.hqyj.service;

import com.hqyj.pojo.House1;

import java.util.Map;

/**
 * author  Jayoung
 * createDate  2020/8/7 0007 9:28
 * version 1.0
 */
public interface HouseService {

    //王福开始
    //分页查询空闲的房间
    Map<String, Object> selectAllHouseByPage(House1 house);

    //ajax请求：通过hId查询房间信息，展示到模态框中
    House1 selectHouseById(Integer hId);

    int updatehState(House1 house);

    int selectVacantRoom();


    //王福结束

}
