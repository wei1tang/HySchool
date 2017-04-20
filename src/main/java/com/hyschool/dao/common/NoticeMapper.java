package com.hyschool.dao.common;

import com.hyschool.bean.common.Notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface NoticeMapper {

    void createNoticeNoFromId(Notice notice);

    void createNoticeWithFromId(Notice notice);

    void readManyNotice(@Param("idList") List<Integer> idList, @Param("readTime")Date readTime);

    void deleteManyNotice(@Param("idList") List<Integer> idList);

}