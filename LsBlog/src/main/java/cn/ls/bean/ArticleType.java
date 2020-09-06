package cn.ls.bean;

/**
 * @Author: li.shun
 * @Description: 文章类型bean
 * @Date: 2019/4/22 12:53
 * @Version: 1.0
 */
public class ArticleType {
    private Integer typeId;
    //文章类型名称
    private String typeName;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
