package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.dao.Enter1Mapper;
import com.hqyj.pojo.Enter1;
import com.hqyj.service.EnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author  Jayoung
 * createDate  2020/8/7 0007 9:28
 * version 1.0
 */
@Service
public class EnterServiceImpl implements EnterService {
    @Autowired
    private Enter1Mapper enter1Mapper;

    //王福开始----------------------------------
    //分页查询：入住信息
    @Override
    public Map<String, Object> selectEnterInfoByPage(Enter1 enter, Integer hId) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(enter.getPage(),enter.getRow());
        List<Enter1> enterList = enter1Mapper.selectEnterInfo(hId);
        PageInfo<Enter1> pageInfo = new PageInfo<Enter1>(enterList);
        map.put("pageInfo",pageInfo.getList());//分页的所有数据
        map.put("total",pageInfo.getTotal());//总条数
        map.put("pages",pageInfo.getPages());//总页数
        map.put("prePage",pageInfo.getPrePage());//上一页
        map.put("nextPage",pageInfo.getNextPage());//下一页
        map.put("firstPage",pageInfo.getFirstPage());//首页
        map.put("lastPage",pageInfo.getLastPage());//尾页
        map.put("isHasNextPage",pageInfo.isHasNextPage());//是否有下一页
        map.put("isHasPreviousPage",pageInfo.isHasPreviousPage());//是否有上一页
        map.put("pageNum",pageInfo.getPageNum());//当前页码
        return map;
    }

    @Override
    public int selectOrderRoomByeState() {
        return enter1Mapper.selectOrderRoomByeState();
    }

    //通过客户ID(cId)查询房间信息、楼层信息和客户信息，并携带操作员信息，展示到模态框中
    @Override
    public Enter1 selectInfoByCustomerId(Integer cId) {
        return enter1Mapper.selectInfoByCustomerId(cId);
    }

    @Override
    public int updateInfo(Enter1 enter) {
        return enter1Mapper.updateByPrimaryKeySelective(enter);
    }

    @Override
    public int insertInfo(Enter1 enter) {
        return enter1Mapper.insertSelective(enter);
    }

    //王福结束----------------------------------

}
