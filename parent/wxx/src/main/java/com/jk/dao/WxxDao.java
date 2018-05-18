package com.jk.dao;


import com.jk.pojo.Power;

import java.util.List;

public interface WxxDao {

    List<Power> getTree(Integer t_id);
}
