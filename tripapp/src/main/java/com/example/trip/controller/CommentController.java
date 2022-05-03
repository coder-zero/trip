package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Comment;
import com.example.trip.service.CommentService;
import com.example.trip.utils.R;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@RestController
@RequestMapping("/trip/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

//    发布留言
    @PostMapping("/reply")
    @LogAnnotation(module = "留言",operator = "发布留言")
    public R reply(@RequestBody Comment comment){
        comment.setCreateTime(new Date());
        if (commentService.save(comment)){
            return R.ok().message("发布成功");
        }else {
            return R.error().message("发布失败");
        }
    }

//    删除留言
    @PostMapping("/delComment")
    @LogAnnotation(module = "留言",operator = "删除留言")
    public R delComment(String ids){
        commentService.delComment(ids);
        return R.ok().message("删除成功");
    }

//    通过酒店获取留言
    @GetMapping("/getCommentByBelongId")
    public R getCommentHotelId( Integer id, Integer commentType){
//        List<Comment> commentByBelongId = commentService.getCommentByBelongId(id);
        List<Comment> commentByBelongId = commentService.getReply(id,commentType);
        return R.ok().data("commentByBelongId", commentByBelongId);
    }
//

//    分页获取留言
    @PostMapping("/getAllComment/{current}/{size}")
    public R getAllComment(@Param(value = "page")Page<Comment> page, @RequestBody Comment comment){
        IPage<Comment> allComment = commentService.getAllComment(page, comment);
        return R.ok().data("allComment", allComment);
    }
}

