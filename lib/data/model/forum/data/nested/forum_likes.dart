class Likes {
  String? forumId;
  String? userId;

  Likes({this.forumId, this.userId});

  Likes.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }

}