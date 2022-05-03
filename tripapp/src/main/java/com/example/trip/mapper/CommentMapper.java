package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Repository
public interface CommentMapper extends BaseMapper<Comment> {


    @Select("<script>" +
            "select c.id, c.comment_content,c.create_time, c.comment_type, ho.hotel_name, s.spot_name, u.real_name commentName from comment c left join hotel ho on c.belong_id = ho.id \n" +
            "left join spot s on c.belong_id = s.id \n" +
            "left join user u on c.user_id = u.id \n" +
            "<where> 1 = 1" +
            "<if test= \" comment.hotelName != null and comment.hotelName != '' \"> AND c.comment_type = 0 AND c.belong_id in (select id from hotel h where h.hotel_name like concat('%',#{comment.hotelName},'%')) </if>" +
            "<if test= \" comment.spotName != null and comment.spotName != '' \"> AND c.comment_type = 1 AND c.belong_id in (select id from spot s where s.spot_name like concat('%',#{comment.spotName},'%')) </if>" +
            "<if test= \" comment.commentName != null and comment.commentName != '' \"> AND c.user_id in (select id from user us where us.username like concat('%',#{comment.commentName},'%'))</if>" +
            "<if test= \" comment.commentContent != null and comment.commentContent != '' \"> AND c.comment_content like concat('%',#{comment.commentContent},'%')</if>" +
            "</where>" +
            "</script>")
    public IPage<Comment> getAllComment(@Param(value = "page") Page<Comment> page, @Param(value = "comment") Comment comment);

    @Select("select *, u.username from comment c left join user u on c.user_id = u.id where belong_id = #{id} and pid = 0")
    public List<Comment> getCommentByBelongId(Integer id);

    @Select("select *, u.username from comment c left join user u on c.user_id = u.id where pid = #{pid}")
    public List<Comment> getChildrenAll(Integer pid);

    @Select("SELECT c.comment_type,c.id,c.comment_content,c.create_time createTime,c.user_id userId,u.real_name commentName,u.img_url commentImg from comment c LEFT JOIN user u on c.user_id = u.id WHERE c.belong_id = #{belongId} and c.pid = 0 and c.comment_type=#{commentType}")
    List<Comment> getOneLevel(@Param(value = "belongId") Integer belongId, @Param(value = "commentType") Integer commentType);

    @Select("SELECT c.comment_type,c.id,c.comment_content,c.create_time createTime,c.user_id userId,u.real_name commentName,u.img_url commentImg,r.real_name replyName from comment c LEFT JOIN user u on c.user_id = u.id LEFT JOIN user r on r.id = (select user_id from comment where id = #{pid}) WHERE c.pid = #{pid} and c.comment_type=#{commentType}")
    List<Comment> getChildren(@Param(value = "pid") Integer pid, @Param(value = "commentType") Integer commentType);


}
