package com.hqyj.service;

import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.House1;
import com.hqyj.pojo.Login;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * author  Jayoung
 * createDate  2020/8/7 0007 12:29
 * version 1.0
 */
public interface TestService {
    String checkLogin(Login login);

    String userNameIsrePeat(String username);

    String SignCustomer(Customer1 customer);

    HashMap<String, Object> roomselectByPage(House1 house);

    House1 selectAromm(int parseInt);

    String reservationRoom(House1 house, Enter1 enter, HttpServletRequest request);
}
