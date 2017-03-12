package com.hyschool.util;

public final class ConstantsUtil {
	
	private ConstantsUtil() { }

    public static final String EMAIL_NICK = "HySchool";

	//发送邮件主题
    public static final String REGISTER_SUBJECT = "欢迎使用 HySchool,请确认邮箱";

    public static final String RESET_PASSWORD_SUBJECT = "重置密码";

    //state
    public static final Integer STATE_INVALID = 1;

    public static final Integer STATE_AVAILABLE = 2;

    public static final Integer STATE_CHECKING = 3;

    //userType
    public static final Integer USER_VIP = 1;

    public static final Integer USER_BUSINESS = 2;

    public static final Integer USER_ADMIN = 3;

    public static final String ENCODING = "UTF-8";
}
