class CommentData {
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  CommentData({this.forumCommentId,
    this.forumId,
    this.userId,
    this.comment,
    this.createdAt});

  CommentData.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

}