package com.info5100.travel.controller.frontdesk;

import com.info5100.travel.pojo.Category;
import com.info5100.travel.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/frontdesk/category")
public class FrontdeskCategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/all")
    @ResponseBody
    public List<Category> all(){
        return categoryService.findAll();
    }
}
