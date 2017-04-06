package com.hyschool.enums;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by LJW on 2017/4/5.
 */
public enum Category {

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

    public static final Map<Integer, Category> CATEGORIES;

    static {
        Map<Integer, Category> map = new LinkedHashMap<>();
        for (Category category : Category.values()) {
            map.put(category.getCode(), category);
        }
        CATEGORIES = Collections.unmodifiableMap(map);
    }

    private Integer code;

    private String description;

    Category(Integer code, String description){
        this.code = code;
        this.description = description;
    }

    public static Category getByCode(Integer code) {
        return CATEGORIES.get(Integer.valueOf(code));
    }

    public Integer getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public static void main(String[] args) {
        System.out.println(CATEGORIES);
        System.out.println(CATEGORIES.get(2).getDescription());
    }
}
