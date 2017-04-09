package com.hyschool.utils;

/**
 * Created by LJW on 2017/4/5.
 */
public class PageUtil {

    public static final int DEFAULT_PAGE_NO = 1;

    public static final int DEFAULT_CATEGORY_ID = 1;

    public static final int Goods_DEFAULT_PAGE_SIZE = 12;

    public static int getTotalPageCount(int totalCount, int pageSize) {
        if (totalCount % pageSize == 0)
            return totalCount / pageSize;
        else
            return totalCount / pageSize + 1;
    }

    public static boolean hasNextPage(int pageNo, int totalCount, int pageSize) {
        return (pageNo < getTotalPageCount(totalCount, pageSize));
    }

    public static boolean hasPreviousPage(int pageNo) {
        return (pageNo > 1);
    }

    public static int getStartOfPage(int pageNo, int pageSize) {
        return (pageNo - 1) * pageSize;
    }
}
