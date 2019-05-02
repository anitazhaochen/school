package com.haiwen.school.zx.service.impl;

import com.haiwen.school.zx.beans.Homework;
import com.haiwen.school.zx.mapper.HomeworkMapper;
import com.haiwen.school.zx.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HomeworkServiceImpl implements HomeworkService {
    @Autowired
    private HomeworkMapper homeworkMapper;
    public int insert(Homework homework) {
        homeworkMapper.insert(homework);

        return 0;
    }

    public int updatestatus(Homework homework) {
        return 0;
    }

    public Map<String, Object> getAll() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Homework> list = homeworkMapper.getAll();
        map.put("code",0);
        map.put("msg","查询不到数据");
        map.put("data",list);
        return map;
    }

    public Homework selectByPrimaryKey(int id) {
        return homeworkMapper.selectByPrimaryKey(id);
    }
}
