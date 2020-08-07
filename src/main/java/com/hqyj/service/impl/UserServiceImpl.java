package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.dao.Enter1Mapper;
import com.hqyj.dao.House1Mapper;
import com.hqyj.dao.User1Mapper;
import com.hqyj.pojo.Enter1;
import com.hqyj.pojo.House1;
import com.hqyj.pojo.User1;
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

    @Autowired
    private House1Mapper house1Mapper;

    @Override
    public HashMap<String, Object> checkOutPage(Enter1 enter1) {

        PageHelper.startPage(enter1.getPage(),enter1.getRow());

        List<Enter1> enter1List = enter1Mapper.selectLivingEnter();
//        System.out.println("--------enterList----------");
//        System.out.println(enter1List);

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

    @Override
    public Enter1 selectLivingDetailByEId(int eId) {
        Enter1 enter1 = enter1Mapper.selectLivingDetailByEId(eId);
        return enter1;
    }

    @Override
    public int checkOutEnter(HashMap map,int hId) {
        int i =enter1Mapper.checkOutEnter(map);
        int m = house1Mapper.checkOutHouse(hId);
        return i+m;
    }

    //陈鸿开始----------------------------------
    @Override
    public HashMap<String, Object> selectByPage(House1 house1) {
        //1、设置分页参数，页码和每页显示行数
        PageHelper.startPage(house1.getPage(),house1.getRow());
        //2、查询自定义的sql
        List<House1> list =house1Mapper.selectByPage(house1);
        //3、转换为分页对象
        PageInfo<House1> pageInfo =new PageInfo<House1>(list);

        //构建数据类型
        HashMap<String,Object> map=new HashMap<String, Object>();
        map.put("list",pageInfo.getList());
        map.put("count",pageInfo.getTotal());
        map.put("prePage",pageInfo.getPrePage());
        map.put("nextPage",pageInfo.getNextPage());
        map.put("indexPage",pageInfo.getFirstPage());
        map.put("endPage",pageInfo.getLastPage());
        map.put("allPage",pageInfo.getPageSize());
        return map;
    }

    @Override
    public House1 selectByHid(int hId) {
        return house1Mapper.selectByPrimaryKey(hId);
    }

    @Override
    public int update(House1 houser1) {
        return house1Mapper.updateByPrimaryKeySelective(houser1);
    }

    @Override
    public int delHouse(int hId) {
        return house1Mapper.deleteByPrimaryKey(hId);
    }

    @Override
    public int insertHouse(House1 houser1) {
        return house1Mapper.insertSelective(houser1);
    }

    @Override
    public int delAllHouse(List<String> list) {
        return house1Mapper.delAll(list);
    }


    //陈鸿结束------------------------------------

    //王福开始-----------------------------------

    @Override
    public User1 selectUserById(Integer user_id) {
        return user1Mapper.selectByPrimaryKey(user_id);
    }

    //王福结束-----------------------------------

}
