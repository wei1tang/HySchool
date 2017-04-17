package com.hyschool.dao.common;

import com.hyschool.bean.common.Notice;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeMapper {

    void createNotice(Notice notice);

}