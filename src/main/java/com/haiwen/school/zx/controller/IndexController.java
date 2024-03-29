package com.haiwen.school.zx.controller;

import com.haiwen.school.zx.beans.Logininfo;
import com.haiwen.school.zx.beans.Notice;
import com.haiwen.school.zx.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/index")
    public String toIndex(HttpSession session, HttpServletRequest request){
        Logininfo logininfo= (Logininfo) session.getAttribute("userInfo");
        if(logininfo==null){
            request.setAttribute("msg","请登录后访问本管理系统，谢谢！");
        }else if(logininfo.getPowerid()==4){
            request.setAttribute("msg","当前账号被禁用，谢谢！");
        }
        else {


            int powerid = logininfo.getPowerid();
            if (powerid==1)return "admin/admin-index";
            if (powerid==2)return "admin/teacher-index";

        }
        return "admin/student-index";
    }

    @RequestMapping("/welcome")
    public String toWelcom(Model model){
        Notice notice = noticeService.get();
        model.addAttribute("notice", notice);
        return "admin/welcome";
    }
}
