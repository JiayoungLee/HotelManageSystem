package com.hqyj.dao;

import com.hqyj.pojo.User1;

public interface User1Mapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(User1 record);

    int insertSelective(User1 record);

    User1 selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User1 record);

    int updateByPrimaryKey(User1 record);

    //王静开始

    User1 selectByPersonNameAndPersonPassword(String username);

    //王静结束

}