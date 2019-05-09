package cn.ls.bean;

/**
 * @Author: li.shun
 * @Description: 文章实体类
 * @Date: 2019/4/21 12:56
 * @Version: 1.0
 */
public class Article {

    private Integer articleId;
    //文章标题
    private String articlename;
   /* //图片路径
    private String imgpath;*/
    //文章内容
    private String articlecontent;

    private String typeId;
    private ArticleType articleType;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticlename() {
        return articlename;
    }

    public void setArticlename(String articlename) {
        this.articlename = articlename;
    }

 /*  public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }*/

    public String getArticlecontent() {
        return articlecontent;
    }

    public void setArticlecontent(String articlecontent) {
        this.articlecontent = articlecontent;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
    }
}
