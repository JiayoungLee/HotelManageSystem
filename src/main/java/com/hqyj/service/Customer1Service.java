package com.hqyj.service;

import com.hqyj.pojo.Customer1;

public interface Customer1Service {

    //符鸿夷开始----------------------------------

    Customer1 selectByCustomer(int cId);

    int update(Customer1 customer1);

    int updatePassword(Customer1 customer1);

    //符鸿夷结束-----------------------------------
}
