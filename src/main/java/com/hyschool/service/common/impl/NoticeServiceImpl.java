package com.hyschool.service.common.impl;

import com.hyschool.bean.common.Notice;
import com.hyschool.bean.vip.Vip;
import com.hyschool.dao.common.NoticeMapper;
import com.hyschool.enums.NoticeEnum;
import com.hyschool.service.common.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by LJW on 2017/4/17.
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeMapper noticeMapper;


    @Override
    public void createAuditVipApprovePassNotice(Integer toVipId) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setContent(NoticeEnum.AUDIT_VIP_APPROVE_PASS.getContent());
        notice.setType(NoticeEnum.AUDIT_VIP_APPROVE_PASS.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createAuditVipApproveFailNotice(Integer toVipId, String reason) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        String content = String.format(NoticeEnum.AUDIT_VIP_APPROVE_FAIL.getContent(), reason);
        notice.setContent(content);
        notice.setType(NoticeEnum.AUDIT_VIP_APPROVE_FAIL.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createAuditGoodsPassNotice(Integer toVipId, String goodsName) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        String content = String.format(NoticeEnum.AUDIT_GOODS_PASS.getContent(), goodsName);
        notice.setContent(content);
        notice.setType(NoticeEnum.AUDIT_GOODS_PASS.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createAuditGoodsFailNotice(Integer toVipId, String goodsName, String reason) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        String content = String.format(NoticeEnum.AUDIT_GOODS_FAIL.getContent(), goodsName, reason);
        notice.setContent(content);
        notice.setType(NoticeEnum.AUDIT_GOODS_FAIL.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createAuditGoodsCloseNotice(Integer toVipId, String goodsName, String reason) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        String content = String.format(NoticeEnum.AUDIT_GOODS_CLOSE.getContent(), goodsName, reason);
        notice.setContent(content);
        notice.setType(NoticeEnum.AUDIT_GOODS_CLOSE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createGoodsCommentsNotice(Integer toVipId, Vip fromVip, String goodsName) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.GOODS_COMMENTS_NOTICE.getContent(), fromVip.getName(), goodsName);
        notice.setContent(content);
        notice.setType(NoticeEnum.GOODS_COMMENTS_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createCommentReplyNotice(Integer toVipId, Vip fromVip, String goodsName) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.COMMENT_REPLY_NOTICE.getContent(), fromVip.getName(), goodsName);
        notice.setContent(content);
        notice.setType(NoticeEnum.COMMENT_REPLY_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createMessageBoardNotice(Integer toVipId, Vip fromVip) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.MESSAGE_BOARD_NOTICE.getContent(), fromVip.getName());
        notice.setContent(content);
        notice.setType(NoticeEnum.MESSAGE_BOARD_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createPayOrderNotice(Integer toVipId, Vip fromVip, String orderNumber) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.PAY_ORDER_NOTICE.getContent(), fromVip.getName(), orderNumber);
        notice.setContent(content);
        notice.setType(NoticeEnum.PAY_ORDER_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createCancleOrderNotice(Integer toVipId, Vip fromVip, String orderNumber) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.CANCEL_ORDER_NOTICE.getContent(), fromVip.getName(), orderNumber);
        notice.setContent(content);
        notice.setType(NoticeEnum.CANCEL_ORDER_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createVipConfirmOrderNotice(Integer toVipId, Vip fromVip, String orderNumber) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setFromVipId(fromVip.getId());
        String content = String.format(NoticeEnum.VIP_CONFIRM_ORDER_NOTICE.getContent(), fromVip.getName(), orderNumber);
        notice.setContent(content);
        notice.setType(NoticeEnum.VIP_CONFIRM_ORDER_NOTICE.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeWithFromId(notice);
    }


    @Override
    public void createBecomeAdminNotice(Integer toVipId) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setContent(NoticeEnum.BECOME_ADMIN.getContent());
        notice.setType(NoticeEnum.BECOME_ADMIN.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createNoLongerAdminNotice(Integer toVipId) {
        Notice notice = new Notice();
        notice.setToVipId(toVipId);
        notice.setContent(NoticeEnum.NO_LONGER_ADMIN.getContent());
        notice.setType(NoticeEnum.NO_LONGER_ADMIN.getType());
        notice.setUrl("//todo");
        notice.setCreateTime(new Date());
        noticeMapper.createNoticeNoFromId(notice);
    }


    @Override
    public void createNoticeFromAnnouncement() {

    }


    @Override
    public void readManyNotice(List<Integer> idList) {
        Date readTime = new Date();
        noticeMapper.readManyNotice(idList, readTime);
    }


    @Override
    public void deleteManyNotice(List<Integer> idList) {
        noticeMapper.deleteManyNotice(idList);
    }

}
