package com.haiwen.school.zx.mapper;

import com.haiwen.school.zx.beans.Teacherstatus;
import com.haiwen.school.zx.beans.Video;

import java.util.List;
import java.util.Map;

public interface VideoMapper {

    int insert(Video video);

    List<Object> getAll();
}
