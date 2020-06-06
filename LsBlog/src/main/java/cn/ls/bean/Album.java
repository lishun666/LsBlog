package cn.ls.bean;

import javax.xml.crypto.Data;

/**
 * @Author: li.shun
 * @Description: 相册类
 * @Date: 2019/6/10 20:25
 * @Version: 1.0
 */
public class Album {
    private String albumId;
    private String albumName;
    private Data albumTime;
    private String albumDesc;
    private String albumAuthor;

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public Data getAlbumTime() {
        return albumTime;
    }

    public void setAlbumTime(Data albumTime) {
        this.albumTime = albumTime;
    }

    public String getAlbumDesc() {
        return albumDesc;
    }

    public void setAlbumDesc(String albumDesc) {
        this.albumDesc = albumDesc;
    }

    public String getAlbumAuthor() {
        return albumAuthor;
    }

    public void setAlbumAuthor(String albumAuthor) {
        this.albumAuthor = albumAuthor;
    }
}
