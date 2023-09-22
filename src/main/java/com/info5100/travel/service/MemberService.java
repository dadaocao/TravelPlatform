package com.info5100.travel.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.info5100.travel.bean.Result;
import com.info5100.travel.bean.Result;
import com.info5100.travel.mapper.MemberMapper;
import com.info5100.travel.pojo.Member;
import com.info5100.travel.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    private MailUtils mailUtils;
    @Value("${project.path}")
    private String projectPath;

    // 注册
    public Result register(Member member) {
        // 1.保存用户
        // 验证用户名是否重复
        QueryWrapper<Member> queryWrapper = new QueryWrapper();
        queryWrapper.eq("username", member.getUsername());
        List<Member> members = memberMapper.selectList(queryWrapper);
        if (members.size() > 0) {
            return new Result(false, "Username already exists");
        }

        // 验证手机是否重复
        QueryWrapper<Member> queryWrapper1 = new QueryWrapper();
        queryWrapper1.eq("phoneNum", member.getPhoneNum());
        List<Member> members1 = memberMapper.selectList(queryWrapper1);
        if (members1.size() > 0) {
            return new Result(false, "Phone number already exists");
        }

        // 验证邮箱是否重复
        QueryWrapper<Member> queryWrapper2 = new QueryWrapper();
        queryWrapper2.eq("email", member.getEmail());
        List<Member> members2 = memberMapper.selectList(queryWrapper2);
        if (members2.size() > 0) {
            return new Result(false, "Email already exists");
        }

        // 加密密码
        String password = member.getPassword();
        password = encoder.encode(password);
        member.setPassword(password);
        // 设置用户状态为false
        member.setActive(false);

        // 2.发送激活邮件
        // 生成激活码
        String activeCode = UUID.randomUUID().toString();
        // 给用户的邮箱发送一封邮件，该邮件包含一个链接，链接中包含激活码
        String activeUrl = projectPath + "/frontdesk/member/active?activeCode=" + activeCode;
        String text = "Congratulations on your successful registration!<a href = '" + activeUrl + "'>Click</a> to active.";
        mailUtils.sendMail(member.getEmail(), text, "Active your account on Dadaocao Travel!");

        // 保存激活码，激活时比对
        member.setActiveCode(activeCode);
        // 保存用户
        memberMapper.insert(member);
        return new Result(true, "Congratulation!！");
    }

    // 激活用户
    public String active(String activeCode) {
        // 根据激活码查询用户
        QueryWrapper<Member> queryWrapper = new QueryWrapper();
        queryWrapper.eq("activeCode", activeCode);
        Member member = memberMapper.selectOne(queryWrapper);
        // 没有找到用户：激活失败
        if (member == null) {
            return "Activation fails! Activation code error!";
        } else {
            member.setActive(true);
            memberMapper.updateById(member);
            return "Activation successful, please<a href='" + projectPath + "/frontdesk/login'>Log in</a>";
        }
    }

    public Result login(String name, String password) {
        Member member = null;

        // 根据用户名查询
        if (member == null) {
            QueryWrapper<Member> queryWrapper = new QueryWrapper();
            queryWrapper.eq("username", name);
            member = memberMapper.selectOne(queryWrapper);
        }
        // 根据手机查询
        if (member == null) {
            QueryWrapper<Member> queryWrapper = new QueryWrapper();
            queryWrapper.eq("phoneNum", name);
            member = memberMapper.selectOne(queryWrapper);
        }
        // 根据邮箱查询
        if (member == null) {
            QueryWrapper<Member> queryWrapper = new QueryWrapper();
            queryWrapper.eq("email", name);
            member = memberMapper.selectOne(queryWrapper);
        }
        // 没有查询到用户
        if (member == null) {
            return new Result(false, "Wrong user name or password");
        }

        // 验证密码
        boolean flag = encoder.matches(password, member.getPassword());
        if (!flag) {
            return new Result(false, "Wrong user name or password");
        }

        // 验证是否激活
        if (!member.isActive()) {
            return new Result(false, "The user is not activated, please log in to the mailbox to activate the user");
        }

        return new Result(true, "Log in successfully", member);
    }
}
