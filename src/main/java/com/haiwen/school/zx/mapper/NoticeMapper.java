package com.haiwen.school.zx.mapper;

import com.haiwen.school.zx.beans.Notice;

import java.util.List;

public interface NoticeMapper {

    public int insert(Notice notice);

    public List<Object> getAll();
}
