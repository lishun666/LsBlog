package cn.ls.serviceImpl;

import cn.ls.bean.Article;
import cn.ls.bean.ArticleType;
import cn.ls.dao.ArticleTypeDao;
import cn.ls.service.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: li.shun
 * @Description: 文章类型service实现类
 * @Date: 2019/4/22 17:36
 * @Version: 1.0
 */
@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {
    @Autowired
    ArticleTypeDao articleTypeDao;
    @Override
    public List<ArticleType> findAllArticleType() {
        List<ArticleType> typeList = articleTypeDao.findAllArticleType();
        return typeList;
    }
    public void addArticleType(String typeName){
        articleTypeDao.addArticleType(typeName);
    }
    public void  editArticleType(ArticleType articleType){
        articleTypeDao.editArticleType(articleType);
    }
    public void deleteArticleTypeByIds(Integer[] idcard){
        articleTypeDao.deleteArticleTypeByIds(idcard);
    }
    //删除单个文章类型
    public void deleteOneType(Integer typeId){
        articleTypeDao.deleteOneType(typeId);
    }
}
