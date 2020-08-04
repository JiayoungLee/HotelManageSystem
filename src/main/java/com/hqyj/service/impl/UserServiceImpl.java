package com.hqyj.service.impl;

import com.hqyj.dao.Enter1Mapper;
import com.hqyj.dao.User1Mapper;
import com.hqyj.pojo.Enter1;
import com.hqyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * author  Jayoung
 * createDate  2020/8/3 0003 19:44
 * version 1.0
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private User1Mapper user1Mapper;

    @Autowired
    private Enter1Mapper enter1Mapper;

    @Override
    public HashMap<String, Object> checkOutPage(Enter1 enter1) {

        List<Enter1> enter1s = enter1Mapper.selectLivingEnter();
        System.out.println(enter1);
        return null;
    }
}
