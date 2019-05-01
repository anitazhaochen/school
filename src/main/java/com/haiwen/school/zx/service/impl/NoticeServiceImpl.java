package com.haiwen.school.zx.service.impl;

import com.haiwen.school.zx.beans.Notice;
import com.haiwen.school.zx.mapper.NoticeMapper;
import com.haiwen.school.zx.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    public int insert(Notice notice) {
        noticeMapper.insert(notice);
        return 0;
    }

    public Notice get() {
        List<Object> list = noticeMapper.getAll();
        return (Notice) list.get(list.size()-1);
    }

}
