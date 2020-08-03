package com.hqyj.dao;

import com.hqyj.pojo.Fee1;

public interface Fee1Mapper {
    int deleteByPrimaryKey(Integer fId);

    int insert(Fee1 record);

    int insertSelective(Fee1 record);

    Fee1 selectByPrimaryKey(Integer fId);

    int updateByPrimaryKeySelective(Fee1 record);

    int updateByPrimaryKey(Fee1 record);
}