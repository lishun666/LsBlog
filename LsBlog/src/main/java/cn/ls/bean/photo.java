package cn.ls.bean;

/**
 * @Author: li.shun
 * @Description: 照片实体
 * @Date: 2019/6/10 20:29
 * @Version: 1.0
 */
public class photo {
    private String photoId;
    private String albumId;
    private String path;

    public String getPhotoId() {
        return photoId;
    }

    public void setPhotoId(String photoId) {
        this.photoId = photoId;
    }

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
