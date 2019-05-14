package cn.ls.dao;

import cn.ls.bean.Article;

import java.util.List;

/**
 * @Author: li.shun
 * @Description:
 * @Date: 2019/4/27 14:54
 * @Version: 1.0
 */
public interface ArticleDao {
    public List<Article> findAllArticle();

    public void addAricle(Article article);

    public Article findArticleById(Integer articleId);

    public void editArticleById(Article article);
}
