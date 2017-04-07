package com.hyschool;

import com.hyschool.vip.dao.VipMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by LJW on 2017/4/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"/spring/application*.xml"})
@Transactional
public class BaseSpringTestCase {

    @Autowired
    VipMapper vipMapper;

    @Test
    public void test(){
        System.out.println(vipMapper.findVipByEmail("769707043@qq.com"));
    }
}
