import 'package:flutter/material.dart';
import '../../data/controller/forums/forum_controller.dart';

class LikeProvider extends ChangeNotifier{
  static bool isLiked = false;

  Future<bool> likePost(BuildContext context, forumId, bool liked) async{
    isLiked = await ForumController.postLike(context, forumId);
    notifyListeners();
    return isLiked;
  }

}