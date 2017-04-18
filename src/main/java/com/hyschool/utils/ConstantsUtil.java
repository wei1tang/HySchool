package com.hyschool.utils;

public final class ConstantsUtil {
	
	private ConstantsUtil() { }

    public static final String EMAIL_NICK = "HySchool";

	//发送邮件主题
    public static final String REGISTER_SUBJECT = "欢迎使用 HySchool,请确认邮箱";
    public static final String RESET_PASSWORD_SUBJECT = "重置密码";

    //register state
    public static final Integer VIP_STATE_INVALID = 1;
    public static final Integer VIP_STATE_AVAILABLE = 2;
    public static final Integer VIP_STATE_CLOSE = 3;

    //userType
    public static final Integer USER_VIP = 1;
    public static final Integer USER_ADMIN = 2;
    public static final Integer USER_SUPER_ADMIN = 3;

    public static final String ENCODING = "UTF-8";

    //stringUserType
    public static final String STRING_USER_VIP = "普通用户";
    public static final String STRING_USER_ADMIN = "管理员";
    public static final String STRING_USER_SUPER_ADMIN = "超级管理员";

    //图片存储路径
//    public static final String GOODS_IMAGES_FILEPATH = "E:\\HySchool\\images\\goods-images\\";
//    public static final String VIP_APPROVE_IMAGES_FILEPATH = "E:\\HySchool\\images\\vip-approve-images\\";
//    public static final String VIP_AVATAR_IMAGES_FILEPATH = "E:\\HySchool\\images\\vip-avatar-images\\";

    public static final String GOODS_IMAGES_FILEPATH = "/Users/tangwei/Desktop/images/goods-images/";
    public static final String VIP_APPROVE_IMAGES_FILEPATH = "/Users/tangwei/Desktop/images/vip-approve-images/";
    public static final String VIP_AVATAR_IMAGES_FILEPATH = "/Users/tangwei/Desktop/images/vip-avatar-images/";

    //图片访问的url
    public static final String UPLOAD_IMAGES_URL = "http://localhost:8080/previewImage?filePath=";

    //商品状态,state字段
    public static final Integer GOODS_CREATED = 0; //已创建，在收藏夹，未发布状态
    public static final Integer GOODS_UNCHECK = 1; //待审核
    public static final Integer GOODS_PASS = 2; //已通过
    public static final Integer GOODS_FAIL = 3; //已驳回
    public static final Integer GOODS_SOLD = 4; //已卖出
    public static final Integer GOODS_CLOSE = -1; //已下架

    //订单状态
    public static final Integer ORDER_UNPAID = 0; //未付款
    public static final Integer ORDER_PAID_NOTSHIPPED = 1; //已付款,商家未发货
    public static final Integer ORDER_DISTRIBUTION = 2; //配送中
    public static final Integer ORDER_BUSINESS_CONFIRM = 3; //商家确认收货
    public static final Integer ORDER_VIP_CONFIRM = 4; //用户确认收货
    public static final Integer ORDER_VIP_COMPLETE_COMMENT = 5; //用户完成评价
    public static final Integer ORDER_CLOSE = -1; //退单

    //商品照片状态
    public static final Integer IMAGES_EFFECTIVE = 1;
    public static final Integer IMAGES_DELETED = 2; //上传的时候可能删除替换照片

    //用户认证状态
    public static final Integer VIP_APPROVE_UNCHECK = 1;
    public static final Integer VIP_APPROVE_PASS = 2;
    public static final Integer VIP_APPROVE_FAIL = 3;
}
