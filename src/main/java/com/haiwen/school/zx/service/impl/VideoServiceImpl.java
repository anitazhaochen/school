package com.haiwen.school.zx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.haiwen.school.zx.beans.Course;
import com.haiwen.school.zx.beans.Logininfo;
import com.haiwen.school.zx.beans.Video;
import com.haiwen.school.zx.mapper.VideoMapper;
import com.haiwen.school.zx.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;
    public int insert(Video video) {
        videoMapper.insert(video);
        return 0;
    }

    public Map<String, Object> getAll() {
        List<Object> list = videoMapper.getAll();
        System.out.println(list.toArray().length);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","查询不到数据");
        map.put("data",list);
        return map;
    }
}
