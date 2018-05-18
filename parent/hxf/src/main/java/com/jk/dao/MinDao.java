
package com.jk.dao;



import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface MinDao {

    List<Mins> queryMinsAll(@Param("mins") Mins mins);

    List<Mins> queryMins(@Param("begin") Integer begin, @Param("end") Integer end, @Param("mins") Mins mins);

    Mins getMinById(@Param("id") Integer id);

    void modifyMins(Mins mins);

    void addMins(Mins mins);

    void deleteMin(String str);

    List<Mins> queryMinList();
}
