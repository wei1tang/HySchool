package com.hyschool.enums;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by LJW on 2017/4/5.
 */
public enum CategoryEnum {

    CAMPUS_RIDE(1, "校园代步"),
    MOBILE_PHONE(2, "手机"),
    COMPUTER(3, "电脑"),
    DIGITAL_ACCESSORIES(4, "数码配件"),
    DIGITAL(5, "数码"),
    ELECTRICAL_APPLIANCES(6, "电器"),
    SPORT(7, "运动健身"),
    CLOTHES(8, "衣物伞帽"),
    BOOK_MATERIALS(9, "图书教材"),
    LEASE(10, "租赁"),
    ENTERTAINMENT(11, "生活娱乐"),
    OTHERS(12, "其他");

    public static final Map<Integer, CategoryEnum> CATEGORIES;

    static {
        Map<Integer, CategoryEnum> map = new LinkedHashMap<>();
        for (CategoryEnum categoryEnum : CategoryEnum.values()) {
            map.put(categoryEnum.getCode(), categoryEnum);
        }
        CATEGORIES = Collections.unmodifiableMap(map);
    }

    public static CategoryEnum getByCode(Integer code) {
        return CATEGORIES.get(Integer.valueOf(code));
    }

    CategoryEnum(Integer code, String description) {
        this.code = code;
        this.description = description;
    }

    private Integer code;

    private String description;

    public Integer getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

}
