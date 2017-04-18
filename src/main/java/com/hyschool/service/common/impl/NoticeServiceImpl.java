package com.hyschool.service.common.impl;

import com.hyschool.dao.common.NoticeMapper;
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
    public void readManyNotice(List<Integer> idList) {
        Date readTime = new Date();
        noticeMapper.readManyNotice(idList, readTime);
    }

    @Override
    public void deleteManyNotice(List<Integer> idList) {
        noticeMapper.deleteManyNotice(idList);
    }

}
