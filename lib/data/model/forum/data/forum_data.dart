import 'package:la_vie_web/data/model/forum/data/nested/user.dart';
import 'nested/forum_comments.dart';
import 'nested/forum_likes.dart';

class ForumData {
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<Likes>? forumLikes;
  List<Comments>? forumComments;
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
      forumLikes = <Likes>[];
      json['ForumLikes'].forEach((v) {
        forumLikes!.add(Likes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <Comments>[];
      json['ForumComments'].forEach((v) {
        forumComments!.add(Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? PostUser.fromJson(json['user']) : null;
  }
}

