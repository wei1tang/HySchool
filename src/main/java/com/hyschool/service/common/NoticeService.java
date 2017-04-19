package com.hyschool.service.common;

import com.hyschool.bean.vip.Vip;

import java.util.List;

/**
 * Created by LJW on 2017/4/17.
 */
public interface NoticeService {

    void createAuditVipApprovePassNotice(Integer toVipId);

    void createAuditVipApproveFailNotice(Integer toVipId, String reason);

    void createAuditGoodsPassNotice(Integer toVipId, String goodsName);

    void createAuditGoodsFailNotice(Integer toVipId, String goodsName, String reason);

    void createAuditGoodsCloseNotice(Integer toVipId, String goodsName, String reason);

    void createGoodsCommentsNotice(Integer toVipId, Vip fromVip, String goodsName);

    void createCommentReplyNotice(Integer toVipId, Vip fromVip, String goodsName);

    void createMessageBoardNotice(Integer toVipId, Vip fromVip);

    void createPayOrderNotice(Integer toVipId, Vip fromVip, String orderNumber);

    void createCancleOrderNotice(Integer toVipId, Vip fromVip, String orderNumber);

    void createVipConfirmOrderNotice(Integer toVipId, Vip fromVip, String orderNumber);

    void createBecomeAdminNotice(Integer toVipId);

    void createNoLongerAdminNotice(Integer toVipId);

    void createNoticeFromAnnouncement();

    void readManyNotice(List<Integer> idList);

    void deleteManyNotice(List<Integer> idList);

}
