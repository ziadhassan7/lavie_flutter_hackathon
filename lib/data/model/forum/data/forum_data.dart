import 'package:la_vie_web/data/model/forum/data/nested/user.dart';
import 'nested/comment_data.dart';
import 'nested/like_data.dart';

class ForumData {
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<LikeData>? forumLikes;
  List<CommentData>? forumComments;
  PostUser? user;

  ForumData(
      {this.forumId,
        this.title,
        this.description,
        this.imageUrl,
        this.userId,
        this.forumLikes,
        this.forumComments,
        this.user});

  ForumData.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = <LikeData>[];
      json['ForumLikes'].forEach((v) {
        forumLikes!.add(LikeData.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <CommentData>[];
      json['ForumComments'].forEach((v) {
        forumComments!.add(CommentData.fromJson(v));
      });
    }
    user = json['user'] != null ? PostUser.fromJson(json['user']) : null;
  }
}

