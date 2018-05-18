package com.jk.controller.wt;
/*这个类主要针对会员表进行的一系列操作*/
import com.jk.service.WtService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jk.pojo.Member;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("wt")
public class WtController {

    @Resource
    private WtService wtService;
    /*会员查询*/
    @RequestMapping("queryMember")
    @ResponseBody
    /*参数 当前页 每页多少条 和会员实体*/
            public Map<String,Object> queryMember(Integer page, Integer rows, Member member){
                Map<String,Object> map = new HashMap<String, Object>();
                //总数据条数
                map.put("total", wtService.queryMemberAll(member).size());

                //每页的数据
                map.put("rows", wtService.queryMember(page,rows,member));
                System.out.println(map);
                return map;
            }
    /*返回到会员查询页面的方法*/
    @RequestMapping("toMemberShow")
            public  String toMemberShow(){
        return "/wt/membershow"
                ;
    }

    //删除会员信息
    @RequestMapping("delMember")
    @ResponseBody
    /*参数 id字符串*/
            public Map<String,Object> delGgoods(String ids){
                Map<String,Object> map = new HashMap<String, Object>();
                try {
                    wtService.delMember(ids);
                    map.put("success", true);
                } catch (Exception e) {
                    e.printStackTrace();
                    map.put("success", false);
                }
                return map;
            }
    /*修改会员信息 回显到修改页面*/
    @RequestMapping("toUpdateMember")
    /*参数 要修改的数据的id*/
            public ModelAndView toUpdateMember(Integer id){
                /*返回的页面*/
                ModelAndView mav = new ModelAndView("/wt/addMember");
                /*去后台查询并返回数据*/
                mav.addObject("member",wtService.getMemberById(id));
                return mav;
            }
    /*新增以及修改的方法*/
    @RequestMapping("addMember")
    @ResponseBody
    /*参数 会员实体*/
            public Map<String,Object> addMember(Member member, HttpServletRequest request, HttpServletResponse response ){
                Map<String,Object> map = new HashMap<String, Object>();
                try {
                    /*首先判断实体中是否有id 如果有则修改没有就新增*/
                    if(member.getMemberid()!=null){
                        //执行修改
                        wtService.modifyMember(member);
                        map.put("msg", "修改成功！");
                    }else{

                       /* car.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());*/
                        //执行新增
                        wtService.addMember(member);
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
            //锁定会员账号
            @RequestMapping("Suo")
            @ResponseBody
            public String Suo(@RequestParam("memberid") Integer memeberid){

                wtService.Suo(memeberid);
                return"updateSuccess";
            }
            //解锁
            @RequestMapping("Jie")
            @ResponseBody
            public String Jie(@RequestParam("memberid") Integer memeberid){

                wtService.Jie(memeberid);
                return"updateSuccess";
            }
}
