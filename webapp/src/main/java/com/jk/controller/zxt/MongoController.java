package com.jk.controller.zxt;

import com.jk.pojo.LogPojo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mongoController")
public class MongoController {

    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping("/queryLog")
    @ResponseBody
    public Map<String,Object> queryLog(Integer page, Integer rows, String timestart, String timeend){

        System.out.println("开始时间"+timestart);
        System.out.println("结束时间"+timeend);

        Criteria criteria = new Criteria();


        if(timeend!=null&&!"".equals(timeend)){
            if(timestart!=null&&!"".equals(timestart)){
                criteria.and("acttime").lte(timeend).gte(timestart);
            }else{
                criteria.and("acttime").lte(timeend);
            }
        }else if(timestart!=null&&!"".equals(timestart)){
            criteria.and("acttime").gte(timestart);
        }

        Map<String, Object> map=new HashMap<String, Object>();
        Query query = new Query();
        query.skip(page).limit(rows);
        query.addCriteria(criteria);
        System.out.println("query==============================="+query);
        System.out.println("criteria============================"+criteria);
        List<LogPojo> list = mongoTemplate.find(query, LogPojo.class);
        long count = mongoTemplate.count(query,LogPojo.class);

        map.put("total", count);
        map.put("rows", list);

        return map;
    }




}
