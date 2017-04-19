package com.hyschool.service.common;

import java.util.List;

/**
 * Created by LJW on 2017/4/17.
 */
public interface NoticeService {
/*

    void createAuditVipApprovePassNotice();

    void createAuditVipApproveFailNotice();

    void createAuditGoodsPassNotice();

    void createAuditGoodsFailNotice();

    void createAuditGoodsCloseNotice();

    void createGoodsCommentsNotice();

    void createCommentReplyNotice();

    void createMessageBoardNotice();

    void createPayOrderNotice();

    void createCancleOrderNotice();

    void createVipConfirmOrderNotice();

    void createPublicNotice();

    void createBecomeAdminNotice();

    void createNoLongerAdminNotice();

*/

    void readManyNotice(List<Integer> idList);

    void deleteManyNotice(List<Integer> idList);

}
