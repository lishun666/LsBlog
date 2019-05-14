package cn.ls.controller;

import cn.ls.bean.Article;
import cn.ls.bean.ArticleType;
import cn.ls.service.ArticleService;
import cn.ls.service.ArticleTypeService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: li.shun
 * @Description: 对文章进行一些操作
 * @Date: 2019/4/21 12:47
 * @Version: 1.0
 */

@Controller
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTypeService articleTypeService;
    /*
    *
     * @Author chengpunan
     * @Description //TODO 去文章管理首页首页的方法
     * @Date 12:49 2019/4/21
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping("toList")
    public String toIndexList(){
        return "articleManage";
    }
    /*
    *
     * @Author chengpunan
     * @Description //TODO 查询所有文章
     * @Date 14:08 2019/5/14
     * @Param []
     * @return java.util.Map
     **/
    @RequestMapping("findAllArticle")
    @ResponseBody
    public Map findAllArticle(){
        Map map = new HashMap();
        List<Article> articleList =  articleService.findAllArticle();
        map.put("articleList",articleList);
        return map;
    }
    /*
    *
     * @Author chengpunan
     * @Description //TODO 去文章详情页面
     * @Date 14:09 2019/5/14
     * @Param [model, articleId]
     * @return java.lang.String
     **/
    @RequestMapping("toDetailsPage")
    public String toDetailsPage(Model model,String articleId){
        List<ArticleType> typeList = articleTypeService.findAllArticleType();
        model.addAttribute("typeList",typeList);
        if (articleId != null){
            Integer id = Integer.parseInt(articleId);
            //Article article = articleService.findArticleById(id);
            model.addAttribute("articleId",id);
        }
        return "details";
    }
    /*
    *
     * @Author chengpunan
     * @Description //TODO 添加文章
     * @Date 14:09 2019/5/14
     * @Param [article]
     * @return java.util.Map
     **/
    @RequestMapping("addArticle")
    @ResponseBody
    public Map addAricle(Article article){
        Map map = new HashMap();
        try {
            articleService.addAricle(article);
            map.put("status",1);
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",0);
        }
        return map;
    }
    /*
    *
     * @Author chengpunan
     * @Description //TODO 保存图片
     * @Date 14:09 2019/5/14
     * @Param [request, file]
     * @return java.util.Map
     **/
    @RequestMapping(value = "uploadImgs",headers = "Accept=application/json",produces ="application/json;charset=UTF-8")
    @ResponseBody
    public Map uploadImgs(HttpServletRequest request, MultipartFile file){
        Map map = new HashMap(4);
        String imgPath =  articleService.saveImg(request,file);
        if(imgPath != null){
            map.put("imgPath",imgPath);
            map.put("status",1);
        }else {
            map.put("status",0);
        }
        return map;
    }
    /*
    *
     * @Author chengpunan
     * @Description //TODO 删除图片
     * @Date 14:10 2019/5/14
     * @Param [request, imgSrc]
     * @return java.util.Map
     **/
    @RequestMapping(value = "deleteImg",headers = "Accept=application/json",produces ="application/json;charset=UTF-8")
    @ResponseBody
    public Map deleteImg(HttpServletRequest request, String imgSrc){
        String[] list = imgSrc.split("upload/");

        String url = request.getSession().getServletContext().getRealPath("/upload");
        File f=new File(url + "/"+list[1]);
        try {
            f.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
    /*
    *
     * @Author chengpunan
     * @Description //根据id获取文章
     * @Date 14:07 2019/5/14
     * @Param [articleId]
     * @return java.util.Map
     **/
    @RequestMapping("findArticleById")
    @ResponseBody
    public Map findArticleById(String articleId){
        Map map = new HashMap();
        int id = Integer.parseInt(articleId);
        Article article = articleService.findArticleById(id);
        map.put("article",article);
        return map;
    }
    @RequestMapping("editArticle")
    @ResponseBody
    public Map editArticleById(Article article){
        Map map = new HashMap();
        try {
            articleService.editArticleById(article);
            map.put("status",1);
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",0);
        }
        return map;
    }
}
