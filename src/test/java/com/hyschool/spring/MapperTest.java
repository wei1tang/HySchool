package com.hyschool.spring;

import com.hyschool.vip.dao.VipMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

/**
 * Created by LJW on 2017/4/13.
 */
@Rollback(false) //不回滚
public class MapperTest extends BaseSpringTestCase {

    @Autowired
    VipMapper vipMapper;


    /**
     * 数据库可选择性rollBack
     */
    @Test
    public void testMapper() {
        System.out.println(vipMapper.findVipByEmail("769707043@qq.com"));
    }

}
