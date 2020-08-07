package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.dao.House1Mapper;
import com.hqyj.pojo.House1;
import com.hqyj.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author  Jayoung
 * createDate  2020/8/7 0007 9:29
 * version 1.0
 */
@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private House1Mapper houseMapper;


    //分页查询：空闲客房
    @Override
    public Map<String, Object> selectAllHouseByPage(House1 house) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(house.getPage(),house.getRow());
        List<House1> houseList = houseMapper.selectAllHouseByPage(house);
        PageInfo<House1> pageInfo = new PageInfo<House1>(houseList);
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

    //ajax请求：通过hId查询房间信息，展示到模态框中
    @Override
    public House1 selectHouseById(Integer hId) {
        return houseMapper.selectHouseById(hId);
    }

    @Override
    public int updatehState(House1 house) {
        return houseMapper.updateByPrimaryKeySelective(house);
    }

    @Override
    public int selectVacantRoom() {
        return houseMapper.selectVacantRoom();
    }
}
