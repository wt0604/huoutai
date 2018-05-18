package com.jk.controller.hxf;

import com.jk.pojo.Maxs;
import com.jk.service.MaxService;
import com.sun.net.httpserver.Authenticator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/5/13.
 */

@Controller
@RequestMapping("maxController")
public class MaxController {

    @Resource
    private MaxService maxService;

    @RequestMapping("queryMax")
    @ResponseBody
    public Map<String, Object> queryMax(Integer page,Integer rows,Maxs maxs){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",maxService.queryMaxsAll(maxs).size());
        map.put("rows",maxService.queryMaxs(page,rows,maxs));
        return map;
    }

    @RequestMapping("deleteMax")
    @ResponseBody
    public String deleteMax(String idss){
        maxService.deleteMax(idss);
        return "success";
    }

    @RequestMapping("toUpdateMax")
    public ModelAndView toUpdateMax(Integer id){
        ModelAndView mav = new ModelAndView("/hxf/addMax");
        mav.addObject("maxs",maxService.getMaxById(id));
        return mav;
    }

    @RequestMapping("addMax")
    @ResponseBody
    public Map<String,Object> addMax(Maxs maxs, HttpServletRequest request, HttpServletResponse response ){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            if(maxs.getMaxtypeid()!=null){
                //执行修改
                maxService.modifyMaxs(maxs);
                map.put("msg", "修改成功！");
            }else{

               /* car.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());*/
                //执行新增
                maxService.addMaxs(maxs);
                map.put("msg", "新增成功！");
            }
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "执行失败！");
        }
        return map;

    }

    /**
     * 查询小类时加载所属大类
     * @return
     */
    @RequestMapping("queryMaxList")
    @ResponseBody
    public List<Maxs> queryMaxList(){
        List<Maxs> list = maxService.queryMaxList();
        return list;
    }
}
