package cn.ls.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: li.shun
 * @Description: 首页管理类
 * @Date: 2019/4/27 10:29
 * @Version: 1.0
 */
@Controller
@RequestMapping("index")
public class IndexController {

    @RequestMapping("toPage")
    public String toIndex(){
        return "index";
    }
}
