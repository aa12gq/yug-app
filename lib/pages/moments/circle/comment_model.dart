class CommentModel {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String content;
  final String timeAgo;
  final List<CommentModel> replies;

  CommentModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.timeAgo,
    this.replies = const [],
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String,
      content: json['content'] as String,
      timeAgo: json['timeAgo'] as String,
      replies: (json['replies'] as List?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'content': content,
      'timeAgo': timeAgo,
      'replies': replies.map((e) => e.toJson()).toList(),
    };
  }
}
