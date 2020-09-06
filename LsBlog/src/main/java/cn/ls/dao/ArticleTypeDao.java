package cn.ls.dao;

import cn.ls.bean.ArticleType;

import java.util.List;

/**
 * @Author: li.shun
 * @Description:
 * @Date: 2019/4/22 17:40
 * @Version: 1.0
 */
public interface ArticleTypeDao {
    //查询所有文章类型
    public List<ArticleType> findAllArticleType();

    //添加文章类型
    public void addArticleType(String typeName);

    //修改文章类型
    public void editArticleType(ArticleType articleType);

    //删除文章类型
    public void deleteArticleTypeByIds(Integer[] idcard);

    //删除单个文章类型
    public void deleteOneType(Integer typeId);
}
