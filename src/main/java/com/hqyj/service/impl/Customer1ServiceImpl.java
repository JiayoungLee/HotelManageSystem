package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.dao.Customer1Mapper;
import com.hqyj.dao.Enter1Mapper;
import com.hqyj.dao.Fee1Mapper;
import com.hqyj.dao.House1Mapper;
import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.Fee1;
import com.hqyj.pojo.House1;
import com.hqyj.service.Customer1Service;
import com.hqyj.utils.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class Customer1ServiceImpl implements Customer1Service {
    @Autowired
    private Customer1Mapper customer1Mapper;

    @Autowired
    private House1Mapper house1Mapper;

    @Autowired
    private Fee1Mapper fee1Mapper;

    @Autowired
    private Enter1Mapper enter1Mapper;

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
        String password = new Encryption().customerMd5IsEncryption(customer1.getcAccount(),customer1.getcPassword());
        customer1.setcPassword(password);

        return customer1Mapper.updateByPrimaryKeySelective(customer1);
    }
    //符鸿夷结束-------------------------------------

    //李磊开始------------------------------------
    @Override
    public HashMap<String, Object> selectByOrderPage(House1 house) {
        PageHelper.startPage(house.getPage(),house.getRow());
        List<House1> list = house1Mapper.selectByOrderPage(house);
        System.out.println("--------------houseList-----------"+list);

        //转换为分页对象
        PageInfo<House1> pageInfo = new PageInfo<House1>(list);
        //构建数据类型
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("list",pageInfo.getList());
        map.put("count",pageInfo.getTotal());
        map.put("prePage",pageInfo.getPrePage());
        map.put("nextPage",pageInfo.getNextPage());
        map.put("indexPage",pageInfo.getFirstPage());
        map.put("endPage",pageInfo.getLastPage());
        map.put("allPage",pageInfo.getPageSize());
        return map;
    }

    //撤销订单
    @Override
    public int cancelOrder(String hName) {

        return house1Mapper.updateByhName(hName);

    }

    @Override
    public int toForm(Fee1 fee) {
        return fee1Mapper.insertFeeByFee(fee);
    }

    @Override
    public Fee1 selectFee(Integer enterId) {
        return fee1Mapper.selectFee(enterId);
    }

    @Override
    public int deleteOne(int eId) {
        return enter1Mapper.deleteOne(eId);
    }


    //李磊结束------------------------------------


    //王福开始------------------------------------

    //添加客人信息
    @Override
    public int addCustomer(Customer1 customer) {
        return customer1Mapper.insertSelective(customer);
    }

    @Override
    public int editEnterState(Integer eId) {
        return enter1Mapper.editEnterState(eId);
    }

    //王福结束------------------------------------

}
