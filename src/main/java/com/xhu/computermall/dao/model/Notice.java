package com.xhu.computermall.dao.model;

import java.util.Date;
import javax.persistence.*;

public class Notice {
    @Id
    @Column(name = "notice_id")
    private Integer noticeId;

    private String title;

    @Column(name = "publish_time")
    private Date publishTime;

    private String content;

    /**
     * @return notice_id
     */
    public Integer getNoticeId() {
        return noticeId;
    }

    /**
     * @param noticeId
     */
    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    /**
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * @return publish_time
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * @param publishTime
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * @return content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}