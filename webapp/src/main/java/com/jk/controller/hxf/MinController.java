package com.jk.controller.hxf;

import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import com.jk.service.MaxService;
import com.jk.service.MinService;
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
@RequestMapping("minController")
public class MinController {

    @Resource
    private MinService minService;

    /**
     * 分页查询
     * @param page
     * @param rows
     * @param mins
     * @return
     */
    @RequestMapping("queryMin")
    @ResponseBody
    public Map<String, Object> queryMin(Integer page,Integer rows,Mins mins){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",minService.queryMinsAll(mins).size());
        map.put("rows",minService.queryMins(page,rows,mins));
        return map;
    }

    /**
     * 删除
     * @param idss
     * @return
     */
    @RequestMapping("deleteMin")
    @ResponseBody
    public String deleteMin(String idss){
        minService.deleteMin(idss);
        return "success";

    }

    /**
     * 修改
     * @param id
     * @return
     */
    @RequestMapping("toUpdateMin")
    public ModelAndView toUpdateMin(Integer id){
        ModelAndView mav = new ModelAndView("/hxf/addMin");
        mav.addObject("mins",minService.getMinById(id));
        return mav;
    }

    /**
     * 增加和修改
     * @param mins
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("addMin")
    @ResponseBody
    public Map<String,Object> addMin(Mins mins, HttpServletRequest request, HttpServletResponse response ){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            if(mins.getMintypeid()!=null){
                //执行修改
                minService.modifyMins(mins);
                map.put("msg", "修改成功！");
            }else{

               /* car.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());*/
                //执行新增
                minService.addMins(mins);
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
     * 查询商品时加载所属小类
     * @return
     */
    @RequestMapping("queryMinList")
    @ResponseBody
    public List<Mins> queryMinList(){
        List<Mins> list = minService.queryMinList();
        return list;
    }
}
