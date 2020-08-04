package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

        PageHelper.startPage(enter1.getPage(),enter1.getRow());

        List<Enter1> enter1List = enter1Mapper.selectLivingEnter();

        PageInfo<Enter1> pageInfo = new PageInfo<>(enter1List,2);

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("list", pageInfo.getList());
        //总记录数
        map.put("count", pageInfo.getTotal());
        map.put("prePage", pageInfo.getPrePage());
        map.put("nextPage", pageInfo.getNextPage());
        map.put("indexPage", pageInfo.getFirstPage());
        //每页的数量
        map.put("numPerPage", pageInfo.getPageSize());
        //当前页码
        map.put("currentPage", pageInfo.getPageNum());
        //总页码
        map.put("totalPageNum", pageInfo.getPages());
        map.put("navigatepageNums", pageInfo.getNavigatepageNums());

        return map;
    }
}
