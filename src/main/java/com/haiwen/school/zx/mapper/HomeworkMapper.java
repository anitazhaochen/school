package com.haiwen.school.zx.mapper;

import com.haiwen.school.zx.beans.Homework;

import java.util.List;

public interface HomeworkMapper {
    public int insert(Homework homework);
    public int updatestatus(Homework homework);
    public List<Homework> getAll();

    public Homework selectByPrimaryKey(int id);
}
