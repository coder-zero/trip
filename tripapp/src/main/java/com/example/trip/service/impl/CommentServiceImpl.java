package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Comment;
import com.example.trip.mapper.CommentMapper;
import com.example.trip.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public IPage<Comment> getAllComment(Page<Comment> page, Comment comment) { return commentMapper.getAllComment(page, comment);}

    @Override
    public void delComment(String ids) {
        String[] split = ids.split(",");
        for (int i=0;i<split.length;i++){
            delCommentById( Integer.parseInt(split[i]) );
        }
    }

    public void delCommentById(int id){
        removeById(id);
        delCommentByPid(id);
    }

    public void delCommentByPid(int pid){
        List<Comment> list = lambdaQuery().eq(Comment::getPid, pid).list();
        if (list !=null){
        for (Comment item:list){
                delCommentById(item.getId());
            }
        }
    }

    @Override
    public List<Comment> getCommentByBelongId(Integer id) {
        List<Comment> commentByBelongId = commentMapper.getCommentByBelongId(id);
            for(Comment item:commentByBelongId){
                getChildren(item);
            }
            return commentByBelongId;
    }

    public void getChildren(Comment comments){
        List<Comment> children = commentMapper.getChildrenAll(comments.getId());
        if (children != null){
            comments.setChildren(children);
            for (Comment item:children){
                getChildren(item);
            }
        }
    }
    public List<Comment> getReply(Integer belongId, Integer commentType){
        List<Comment> parents = commentMapper.getOneLevel(belongId,commentType);
        for(Comment comment:parents){
            List<Comment> children = new ArrayList<>();
            getChildrenComment(comment.getId(),children,commentType);
            comment.setChildren(children);
        }
        return parents;
    }

    private void getChildrenComment(Integer id,List<Comment> commentList, Integer commentType) {
        List<Comment> children = commentMapper.getChildren(id,commentType);
        commentList.addAll(children);
        for(Comment comment:children){
            getChildrenComment(comment.getId(),commentList,commentType);
        }

    }
}

