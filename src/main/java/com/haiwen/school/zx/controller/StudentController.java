package com.haiwen.school.zx.controller;

import com.haiwen.school.zx.beans.*;
import com.haiwen.school.zx.service.CourseService;
import com.haiwen.school.zx.service.HomeworkService;
import com.haiwen.school.zx.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private HomeworkService homeworkService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    //    跳转学生列表
    @RequestMapping("/tolist")
    public String toList() {
        return "user/student-list";
    }
    @RequestMapping("/getList")
    @ResponseBody
    public Map<String, Object> getList(int page, int limit, Student student) {
        return studentService.getAll(page, limit, student);
    }

    @RequestMapping(value = "/toEdit", method = RequestMethod.GET)
    public String toEdit(@RequestParam("id")int id, HttpSession session, HttpServletRequest request, Model model) {
//        根据session中的用户信息获取与之对应的教师资料
        Logininfo logininfo = (Logininfo) session.getAttribute("userInfo");
        Student student = studentService.toUpd(logininfo.getUsername());
        if (student != null) {
            request.setAttribute("student", student);
        }
        Homework h = homeworkService.selectByPrimaryKey(id);
        model.addAttribute("homework", h);
        return "student/student-edit";
    }

    @RequestMapping("/doUpdate")
    @ResponseBody
    public Map<String,Object> doUpdate(Student student){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",studentService.doUpdate(student));
        return map;
    }
    @RequestMapping("doEnter")
    @ResponseBody
    public Map<String, Object> doEnter(HttpSession session,Course course) {
        Map<String, Object> map = new HashMap<String, Object>();
        Courseinfo courseinfo = new Courseinfo();
        courseinfo.setCourseid(course.getId());
        Logininfo logininfo = (Logininfo) session.getAttribute("userInfo");
        Student student = studentService.toUpd(logininfo.getUsername());
        courseinfo.setStuid(student.getId());
        map.put("code",courseService.addCourseInfo(course, courseinfo));
        return map;
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> sumbitHomework( HttpSession session, Homework homework) {
        Logininfo logininfo= (Logininfo) session.getAttribute("userInfo");
        homework.setUserid(logininfo.getId());
        homework.setStatus("已提交");
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:MM:SS");
        homework.setAdddate(ft.format(dNow).toString());
        homeworkService.insert(homework);
        System.out.println(homework);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("code", "1");
        return map;
    }
}