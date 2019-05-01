package com.haiwen.school.zx.service;

import com.haiwen.school.zx.beans.Logininfo;
import com.haiwen.school.zx.beans.Power;
import com.haiwen.school.zx.beans.Video;

import java.util.List;
import java.util.Map;

public interface VideoService {

    int insert(Video video);

    Map<String, Object> getAll();


}
