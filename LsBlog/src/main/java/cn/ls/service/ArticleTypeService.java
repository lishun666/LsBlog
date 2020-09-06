package cn.ls.service;

import cn.ls.bean.ArticleType;

import java.util.List;

/**
 * @Author: li.shun
 * @Description:
 * @Date: 2019/4/22 17:35
 * @Version: 1.0
 */
public interface ArticleTypeService {
    //查询文章类型
    public List<ArticleType> findAllArticleType();

    //新增文章类型
    public void addArticleType(String typeName);

    //修改文章类型
    public void editArticleType(ArticleType articleType);

    //删除文章类型
    public void deleteArticleTypeByIds(Integer[] idcard);

    //删除单个文章
    public void deleteOneType(Integer typeId);
}
