class LikeData {
  String? forumId;
  String? userId;

  LikeData({this.forumId, this.userId});

  LikeData.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }

}