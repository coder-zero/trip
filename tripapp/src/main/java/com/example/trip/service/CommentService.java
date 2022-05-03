package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface CommentService extends IService<Comment> {

    IPage<Comment> getAllComment(Page<Comment> page, Comment comment);
    void delComment(String ids);
    List<Comment> getCommentByBelongId(Integer id);
    List<Comment> getReply(Integer belongId, Integer commentType);

}
