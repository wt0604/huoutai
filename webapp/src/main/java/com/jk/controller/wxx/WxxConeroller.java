package com.jk.controller.wxx;


import com.jk.pojo.Power;
import com.jk.service.WxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WxxConeroller {

    @Autowired
    private WxxService wxxService;

    @RequestMapping("getTree")
    @ResponseBody
    public List<Map<String,Object>> getMenu(HttpServletRequest request, Integer t_id){
       /* User u=(User) request.getSession().getAttribute("user");*/
        List<Power> list = wxxService.getTree(t_id);
        return getList(list, 0);
    }


    private List<Map<String,Object>> getList(List<Power> tree,Integer pid){
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        for (int i = 0; i < tree.size(); i++) {
            Power t = tree.get(i);
            Map<String,Object> map = null;
            if(t!=null){
                if(t.getPid() == pid){
                    map = new HashMap<String, Object>();
                    map.put("text", t.getText());
                    map.put("id", t.getId());
                    map.put("iconCls", t.getIcon());
                    map.put("url", t.getUrl());
                    map.put("children", getList(tree, t.getId()));
                }
            }
            if(map != null){
                List l = (List) map.get("children");
                if(l.size()<=0){
                    map.remove("children");
                }
                list.add(map);
            }
        }
        return list;
    }
}
