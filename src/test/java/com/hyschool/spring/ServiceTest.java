package com.hyschool.spring;

import com.hyschool.service.common.GoodsService;
import com.hyschool.service.common.NoticeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LJW on 2017/4/12.
 */
@Rollback(false) //不回滚
public class ServiceTest extends BaseSpringTestCase {


    @Autowired
    GoodsService goodsService;
    @Autowired
    NoticeService noticeService;


    /**
     * 数据库可选择性rollBack
     */
    @Test
    public void testService() {
        Integer id = 1;
        goodsService.addOneComment(id);
        System.out.println();
    }

    @Test
    public void testNoticeService() {
        List<Integer> idList = new ArrayList<>();
        idList.add(1);
        idList.add(2);
        idList.add(3);
        noticeService.readManyNotice(idList);
        noticeService.deleteManyNotice(idList);
    }

    @Test
    public void testCreateNotice() {
        noticeService.createAuditVipApprovePassNotice(1);
        noticeService.createAuditVipApproveFailNotice(1, "原因哦");

        noticeService.createAuditGoodsPassNotice(2, "goods");
        noticeService.createAuditGoodsFailNotice(2, "goods", "reason");
        noticeService.createAuditGoodsCloseNotice(2, "goods", "reason");
    }


}
