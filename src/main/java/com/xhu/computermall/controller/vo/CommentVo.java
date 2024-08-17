package com.xhu.computermall.controller.vo;

import com.xhu.computermall.dao.model.Comment;
import com.xhu.computermall.dao.model.User;

public class CommentVo {

	private Comment comment;
	private User user;
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
