package com.hqyj.dao;

import com.hqyj.pojo.Enter1;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface Enter1Mapper {
    int deleteByPrimaryKey(Integer eId);

    int insert(Enter1 record);

    int insertSelective(Enter1 record);

    Enter1 selectByPrimaryKey(Integer eId);

    int updateByPrimaryKeySelective(Enter1 record);

    int updateByPrimaryKey(Enter1 record);

    //李佳阳开始
    List<Enter1> selectLivingEnter();

    Enter1 selectLivingDetailByEId(Integer eId);

    int checkOutEnter(HashMap map);
    //李佳阳结束

    //李磊开始
    //删除用户
    int deleteOne(int eId);


    //李磊结束


    //王福开始

    List<Enter1> selectEnterInfo(@Param("hId")Integer hId);

    int selectOrderRoomByeState();

    Enter1 selectInfoByCustomerId(@Param("cId")Integer cId);

    int editEnterState(Integer eId);


    //结束
}
