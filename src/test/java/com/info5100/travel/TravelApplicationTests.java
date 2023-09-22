package com.info5100.travel;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.info5100.travel.bean.RoleWithStatus;
import com.info5100.travel.mapper.AdminMapper;
import com.info5100.travel.mapper.ProductMapper;
import com.info5100.travel.pojo.Admin;
import com.info5100.travel.pojo.Product;
import com.info5100.travel.service.AdminService;
import com.info5100.travel.util.MailUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class TravelApplicationTests {
    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private MailUtils mailUtils;
    @Test
    void contextLoads() {
//        Page<Admin> page = adminService.findPage(1,5);
//        System.out.println(page);

//        Admin desc = adminMapper.findDesc(1);
//        System.out.println(desc);

//        List<RoleWithStatus> role = adminService.findRole(1);
//        System.out.println(role);

//        Page<Product> productPage = productMapper.findProductPage(new Page(1,5));
//        System.out.println(productPage);

        mailUtils.sendMail("577974412@qq.com","test","title test");

    }

}
