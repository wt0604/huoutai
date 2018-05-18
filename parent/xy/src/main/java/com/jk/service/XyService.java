package com.jk.service;
import com.jk.pojo.Account;

import java.util.List;
import java.util.Map;

    public interface XyService {
    Map query(Account emp, Integer page, Integer rows);

        void del(Integer id);

        void addAccount(Account account);

        List queryAcc();
    }
