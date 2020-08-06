package com.hqyj.service.impl;

import com.hqyj.dao.Customer1Mapper;
import com.hqyj.pojo.Customer1;
import com.hqyj.service.Customer1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Customer1ServiceImpl implements Customer1Service {
    @Autowired
    Customer1Mapper customer1Mapper;

    //符鸿夷开始-------------------------------
    @Override
    public Customer1 selectByCustomer(int cId) {
        return customer1Mapper.selectByCustomer(cId);
    }

    @Override
    public int update(Customer1 customer1) {
        return customer1Mapper.updateByPrimaryKeySelective(customer1);
    }

    @Override
    public int updatePassword(Customer1 customer1) {
        return customer1Mapper.updateByPrimaryKeySelective(customer1);
    }



    //符鸿夷结束-------------------------------------
}
