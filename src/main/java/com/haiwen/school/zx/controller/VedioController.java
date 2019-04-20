package com.haiwen.school.zx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;

@Controller
@RequestMapping("/Test")
public class VedioController {

        /**
         * 视频跳转
         * @param id
         * @return
         */
        @RequestMapping("/getVideo")
        public String getVideo(String id) {
//            ModelAndView mav = new ModelAndView("success");
//            mav.addObject("path", "/Test/Test/video.do?id="+id);
//            return mav;
            System.out.println("111111111111111");
            return "course/video";
        }

//            @RequestMapping("/getVideo.do")
//        public String getVideo(String id,HttpServletRequest request) {
//                request.setAttribute("videopath","");
//            ModelAndView mav = new ModelAndView("success");
//            mav.addObject("path", "/Test/Test/video.do?id="+id);
//            return "course/video.jsp";
//        }

        /**
         * 视频流读取
         * @param id
         * @param response
         * @throws Exception
         */
        @RequestMapping("/video.do")
        public @ResponseBody
        void video(String id, HttpServletResponse response)throws Exception{
            System.out.println("流媒体 执行");
            File file = new File("/Users/zhaochen/Desktop/video/temp/1555691874409.mp4");
            FileInputStream in = new FileInputStream(file);
            ServletOutputStream out = response.getOutputStream();
            byte[] b = null;
            while(in.available() >0) {
                if(in.available()>10240) {
                    b = new byte[10240];
                }else {
                    b = new byte[in.available()];
                }
                in.read(b, 0, b.length);
                out.write(b, 0, b.length);
            }
            in.close();
            out.flush();
            out.close();
        }
}

