package com.hqyj.dao;

import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.User1;

public interface Customer1Mapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(Customer1 record);

    int insertSelective(Customer1 record);

    Customer1 selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Customer1 record);

    int updateByPrimaryKey(Customer1 record);

    Customer1 selectByCustomer(int cId) ;

    Customer1 selectByPersonNameAndPersonPassword(String username);
}