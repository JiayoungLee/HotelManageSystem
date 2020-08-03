package com.hqyj.dao;

import com.hqyj.pojo.Floor1;

public interface Floor1Mapper {
    int deleteByPrimaryKey(Integer fId);

    int insert(Floor1 record);

    int insertSelective(Floor1 record);

    Floor1 selectByPrimaryKey(Integer fId);

    int updateByPrimaryKeySelective(Floor1 record);

    int updateByPrimaryKey(Floor1 record);
}