package com.jk.service.impl;


import com.jk.dao.WxxDao;
import com.jk.pojo.Power;
import com.jk.service.WxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WxxServiceImpl implements WxxService {
    @Autowired
    private WxxDao mapper;


    public List<Power> getTree(Integer t_id) {
         return mapper.getTree(t_id);
    }
}
