package com.hqyj.dao;

import com.hqyj.pojo.Role1;

public interface Role1Mapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role1 record);

    int insertSelective(Role1 record);

    Role1 selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role1 record);

    int updateByPrimaryKey(Role1 record);
}