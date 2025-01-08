class MomentModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String content;
  final List<String> images;
  final String timeAgo;
  final int likes;
  final int comments;

  MomentModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.images,
    required this.timeAgo,
    required this.likes,
    required this.comments,
  });

  // 从JSON创建模型
  factory MomentModel.fromJson(Map<String, dynamic> json) {
    return MomentModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String,
      content: json['content'] as String,
      images: List<String>.from(json['images'] as List),
      timeAgo: json['timeAgo'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userAvatar': userAvatar,
      'content': content,
      'images': images,
      'timeAgo': timeAgo,
      'likes': likes,
      'comments': comments,
    };
  }
}
