package cn.ls.controller;

import cn.ls.bean.ArticleType;
import cn.ls.service.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: li.shun
 * @Description: 文章类型管理
 * @Date: 2019/4/22 12:54
 * @Version: 1.0
 */
@Controller
@RequestMapping("articleType")
public class ArticleTypeController {
    @Autowired
    ArticleTypeService articleTypeService;

    /*
     *
     * @Author chengpunan
     * @Description //TODO 去后台文章类型管理页面方法
     * @Date 12:55 2019/4/22
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping("toTable")
    public String toList() {
        return "typeManage";
    }

    /*
     *
     * @Author chengpunan
     * @Description //TODO  获得所有文章类型数据
     * @Date 22:50 2019/4/23
     * @Param []
     * @return java.util.Map
     **/
    @RequestMapping("findAllArticleType")
    @ResponseBody
    public Map findAllArticleType() {
        Map map = new HashMap();
        List<ArticleType> typeList = articleTypeService.findAllArticleType();
        map.put("typeList", typeList);
        return map;
    }
    /*
     *
     * @Author chengpunan
     * @Description //TODO 添加文章类型的方法
     * @Date 12:18 2019/4/24
     * @Param []
     * @return void
     **/

    @RequestMapping("addArticleType")
    @ResponseBody
    public Map addArticleType(String typeName) {
        Map map = new HashMap();
        try {
            articleTypeService.addArticleType(typeName);
            map.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", 0);
        }
        return map;
    }

    /*
     *
     * @Author chengpunan
     * @Description //TODO 修改文章类型
     * @Date 8:46 2019/4/27
     * @Param [typeName]
     * @return java.util.Map
     **/
    @RequestMapping("editArticleType")
    @ResponseBody
    public Map editArticleType(ArticleType articleType) {
        Map map = new HashMap();
        try {
            articleTypeService.editArticleType(articleType);
            map.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", 0);
        }
        return map;
    }

    /*
     *
     * @Author chengpunan
     * @Description //TODO 删除文章类型
     * @Date 8:46 2019/4/27
     * @Param [typeName]
     * @return java.util.Map
     **/
    @RequestMapping("deleteArticleTypeByIds")
    @ResponseBody
    public Map deleteArticleTypeByIds(Integer[] idcard) {
        Map map = new HashMap();
        try {
            articleTypeService.deleteArticleTypeByIds(idcard);
            map.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping("deleteOneType")
    @ResponseBody
    public Map deleteOneType(Integer typeId) {
        Map map = new HashMap();
        try {
            articleTypeService.deleteOneType(typeId);
            map.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", 0);
        }
        return map;
    }
}
