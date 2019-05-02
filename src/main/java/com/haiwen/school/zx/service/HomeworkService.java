package com.haiwen.school.zx.service;

import com.haiwen.school.zx.beans.Homework;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface HomeworkService {
    public int insert(Homework homework);
    public int updatestatus(Homework homework);
    public Map<String,Object> getAll();

    public Homework selectByPrimaryKey(int id);
}
