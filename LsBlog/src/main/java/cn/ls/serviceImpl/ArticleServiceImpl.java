package cn.ls.serviceImpl;

import cn.ls.bean.Article;
import cn.ls.dao.ArticleDao;
import cn.ls.service.ArticleService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @Author: li.shun
 * @Description: 文章管理service
 * @Date: 2019/4/27 14:52
 * @Version: 1.0
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    /*
     *
     * @Description //TODO 查找所有文章
     * @Date 14:24 2019/5/14
     * @Param []
     * @return java.util.List<cn.ls.bean.Article>
     **/
    public List<Article> findAllArticle() {
        List<Article> articleList = articleDao.findAllArticle();
        return articleList;
    }

    /*
     *
     * @Description //TODO 保存文章
     * @Date 14:25 2019/5/14
     * @Param [article]
     * @return void
     **/
    public void addAricle(Article article) {
        articleDao.addAricle(article);
    }

    /*
     *
     * @Description //TODO 保存图片
     * @Date 14:25 2019/5/14
     * @Param [request, file]
     * @return java.lang.String
     **/
    public String saveImg(HttpServletRequest request, MultipartFile file) {
        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        //设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/upload");
        //获取图片的网络路径
        String imgPath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + request.getContextPath()
                + "/upload" + "/" + name + "." + ext;
        //以绝对路径保存重名命后的图片
        try {
            String path = url + "/" + name + "." + ext;
            if (!new File(path).exists()) {
                new File(path).mkdirs();
            }
            file.transferTo(new File(url + "/" + name + "." + ext));
            return imgPath;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /*
     *
     * @Description //TODO 根据id查询文章
     * @Date 14:25 2019/5/14
     * @Param [articleId]
     * @return cn.ls.bean.Article
     **/
    public Article findArticleById(Integer articleId) {
        Article article = articleDao.findArticleById(articleId);
        return article;
    }

    /*
     *
     * @Description //TODO 根据id修改文章
     * @Date 14:26 2019/5/14
     * @Param [article]
     * @return void
     **/
    @Override
    public void editArticleById(Article article) {
        articleDao.editArticleById(article);
    }

    /*
     *
     * @Description //TODO 删除文章的方法
     * @Date 13:44 2019/5/20
     * @Param [idcard]
     * @return void
     **/
    public void deleteArticleById(Integer[] idcard) {
        articleDao.deleteArticleById(idcard);
    }

    /*
     *
     * @Author chengpunan
     * @Description //TODO 删除单篇文章
     * @Date 14:49 2019/5/20
     * @Param [articleId]
     * @return void
     **/
    public void deleteOneArticle(Integer articleId) {
        articleDao.deleteOneArticle(articleId);
    }

}
