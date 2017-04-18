package com.hyschool.spring;

import com.hyschool.service.common.GoodsService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

/**
 * Created by LJW on 2017/4/12.
 */
@Rollback(false) //不回滚
public class ServiceTest extends BaseSpringTestCase {


    @Autowired
    GoodsService goodsService;


    /**
     * 数据库可选择性rollBack
     */
    @Test
    public void testService() {
        Integer id = 1;
        goodsService.addOneComment(id);
        System.out.println();
    }


}
