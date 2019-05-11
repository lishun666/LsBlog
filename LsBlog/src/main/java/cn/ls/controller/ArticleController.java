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
    @RequestMapping("findAllArticle")
    @ResponseBody
    public Map findAllArticle(){
        Map map = new HashMap();
        List<Article> articleList =  articleService.findAllArticle();
        map.put("articleList",articleList);
        return map;
    }
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
    @RequestMapping(value = "uploadImgs",headers = "Accept=application/json",produces ="application/json;charset=UTF-8")
    @ResponseBody
    public Map uploadImgs(HttpServletRequest request, MultipartFile file){
        Map map = new HashMap(4);
        String imgPath =   articleService.saveImg(request,file);
        if(imgPath != null){
            map.put("imgPath",imgPath);
            map.put("status",1);
        }else {
            map.put("status",0);
        }
        return map;
    }
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
    @RequestMapping("findArticleById")
    @ResponseBody
    public Map findArticleById(String articleId){
        Map map = new HashMap();
        int id = Integer.parseInt(articleId);
        Article article = articleService.findArticleById(id);
        map.put("article",article);
        return map;
    }
}
