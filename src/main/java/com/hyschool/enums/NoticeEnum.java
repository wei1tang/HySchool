package com.hyschool.enums;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by LJW on 2017/4/18.
 */
public enum NoticeEnum {

    AUDIT_VIP_APPROVE_PASS(1, "恭喜！您的实名认证审核已经通过"),
    AUDIT_VIP_APPROVE_FAIL(2, "抱歉！您的实名认证审核未通过，原因：%s"),
    AUDIT_GOODS_PASS(3, "恭喜！您发表的商品\"%s\"已经审核通过"),
    AUDIT_GOODS_FAIL(4, "抱歉！您发表的商品\"%s\"审核未通过，原因：%s"),
    AUDIT_GOODS_CLOSE(5, "您发表的商品《%s》已被强制下架，原因：%s"),
    GOODS_COMMENTS_NOTICE(6, "\"%s\"评价了您发表的商品\"%s\""),
    COMMENT_REPLY_NOTICE(7, "\"%s\"回复了你在商品\"%s\"下的评论"),
    MESSAGE_BOARD_NOTICE(8, "\"%S\"给您留言了"),
    PAY_ORDER_NOTICE(9, "买家\"%s\"已支付订单，订单号：%s"),
    CANCEL_ORDER_NOTICE(10, "买家\"%s\"已取消订单，订单号：%s"),
    VIP_CONFIRM_ORDER_NOTICE(11, "买家已确认收货，订单号：%s"),
    PUBLIC_NOTICE(12, "花样校园二手街系统通知：%s"),
    BECOME_ADMIN(13, "恭喜您成为花样校园二手街的管理员！"),
    NO_LONGER_ADMIN(14,"很抱歉您不再是花样校园二手街的管理员");

    public static final Map<Integer, NoticeEnum> NOTICES;

    static {
        Map<Integer, NoticeEnum> map = new LinkedHashMap<>();
        for (NoticeEnum noticeEnum : NoticeEnum.values()) {
            map.put(noticeEnum.getType(), noticeEnum);
        }
        NOTICES = Collections.unmodifiableMap(map);
    }

    public static NoticeEnum getByType(Integer type) {
        return NOTICES.get(Integer.valueOf(type));
    }

    NoticeEnum(Integer type, String content) {
        this.type = type;
        this.content = content;
    }

    private Integer type;

    private String content;

    public Integer getType() {
        return type;
    }

    public String getContent() {
        return content;
    }

    /**
     * 使用string.format对message进行填充
     *
     * @param args
     */
    public static void main(String[] args) {
        System.out.println(NoticeEnum.AUDIT_VIP_APPROVE_PASS.getType());
        System.out.println(NOTICES);
        System.out.println(String.format(NOTICES.get(6).getContent(),"ljw","goods"));
    }
}
