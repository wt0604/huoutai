package com.jk.service.impl;
import com.jk.dao.XyDao;
import com.jk.pojo.Account;
import com.jk.service.XyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class XyServiceImpl implements XyService {

    @Autowired
    private XyDao empDap;

    public Map query(Account emp, Integer page, Integer rows) {
        Integer total = empDap.getTotalAcc(emp);
        page = (page- 1)  * rows ;
        List<Account> list = empDap.queryAccount(page,rows,emp);
        Map map = new HashMap();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    @Override
    public void del(Integer id) {
        empDap.del(id);
    }

    @Override
    public void addAccount(Account account) {
        empDap.addAccount(account);
    }

    @Override
    public List<Account> queryAcc() {
        return empDap.queryAcc();
    }
}
