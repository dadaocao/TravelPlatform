package com.info5100.travel.controller.frontdesk;

import com.info5100.travel.bean.Result;
import com.info5100.travel.pojo.Member;
import com.info5100.travel.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/frontdesk/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @RequestMapping("/register")
    public ModelAndView register(Member member, String checkCode, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        // 判断验证码是否正确
        String sessionCheckCode = (String) session.getAttribute("checkCode");
        if (!sessionCheckCode.equalsIgnoreCase(checkCode)){
            modelAndView.addObject("message","Wrong code!");
            modelAndView.setViewName("/frontdesk/register");
            return modelAndView;
        }

        // 注册
        Result result = memberService.register(member);
        if (!result.isFlag()){ // 注册失败
            modelAndView.addObject("message",result.getMessage());
            modelAndView.setViewName("/frontdesk/register");
        }else { // 注册成功
            modelAndView.setViewName("/frontdesk/register_ok");
        }
        return modelAndView;
    }

    @RequestMapping("/active")
    public ModelAndView active(String activeCode){
        ModelAndView modelAndView = new ModelAndView();
        String active = memberService.active(activeCode);
        modelAndView.addObject("message",active);
        modelAndView.setViewName("/frontdesk/active_result");
        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView login(String name,String password,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Result result = memberService.login(name, password);
        if (!result.isFlag()){ // 登录失败
            modelAndView.addObject("message",result.getMessage());
            modelAndView.setViewName("/frontdesk/login");
        }else{ // 登录成功
            // 将用户信息存入session
            session.setAttribute("member",result.getData());
            modelAndView.setViewName("redirect:/frontdesk/index");
        }
        return modelAndView;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("member");
        return "redirect:/frontdesk/index";
    }
}
