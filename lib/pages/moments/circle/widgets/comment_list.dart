import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

class CommentList extends StatelessWidget {
  final List<dynamic> comments;
  final Function(String, dynamic) onReply;

  const CommentList({
    Key? key,
    required this.comments,
    required this.onReply,
  }) : super(key: key);

  Widget _buildCommentItem(dynamic comment, {bool isReply = false}) {
    return Container(
      margin: EdgeInsets.only(
        left: isReply ? 36.w : 0,
        bottom: 8.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.w),
              child: Image.network(
                comment['userAvatar'] ?? 'https://via.placeholder.com/100',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          // 评论内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 用户名和评论内容
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryText,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: comment['userName'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6C5CE7),
                        ),
                      ),
                      if (comment['replyTo'] != null) ...[
                        TextSpan(text: ' 回复 '),
                        TextSpan(
                          text: comment['replyTo'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6C5CE7),
                          ),
                        ),
                      ],
                      TextSpan(text: '：${comment['content']}'),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                // 时间和操作按钮
                Row(
                  children: [
                    Text(
                      comment['timeAgo'] ?? '刚刚',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () => onReply(comment['userName'], comment),
                      child: Text(
                        '回复',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () {
                        // TODO: 处理点赞
                      },
                      child: Row(
                        children: [
                          Icon(
                            comment['isLiked'] ?? false
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: 12.w,
                            color: comment['isLiked'] ?? false
                                ? Colors.red
                                : AppColors.secondaryText,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            (comment['likes'] ?? 0).toString(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // 子评论
                if (comment['replies'] != null &&
                    comment['replies'].isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  ...comment['replies']
                      .map<Widget>(
                          (reply) => _buildCommentItem(reply, isReply: true))
                      .toList(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comments.map((comment) => _buildCommentItem(comment)).toList(),
    );
  }
}
