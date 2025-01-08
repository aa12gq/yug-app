import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import '../comment_model.dart';

class CommentList extends StatelessWidget {
  final List<CommentModel> comments;
  final Function(String, CommentModel?) onReply;

  const CommentList({
    super.key,
    required this.comments,
    required this.onReply,
  });

  Widget _buildCommentItem(CommentModel comment, {CommentModel? parent}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundImage: NetworkImage(comment.userAvatar),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.userName,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  comment.content,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      comment.timeAgo,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () => onReply(comment.userName, parent ?? comment),
                      child: Text(
                        '回复',
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                if (comment.replies.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  ...comment.replies.map((reply) => Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: _buildCommentItem(reply, parent: comment),
                      )),
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
      children: comments.map((comment) => _buildCommentItem(comment)).toList(),
    );
  }
}
