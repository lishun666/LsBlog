package cn.ls.service;

import cn.ls.bean.Article;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: li.shun
 * @Description:
 * @Date: 2019/4/27 14:51
 * @Version: 1.0
 */
public interface ArticleService {
    public List<Article> findAllArticle();

    public void addAricle(Article article);

    public String saveImg(HttpServletRequest request, MultipartFile file);

    public Article findArticleById(Integer articleId);

    public void editArticleById(Article article);

    public void deleteArticleById(Integer[] idcard);

    public void deleteOneArticle(Integer articleId);
}
