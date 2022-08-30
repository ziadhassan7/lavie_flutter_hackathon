import 'package:flutter/material.dart';
import '../../data/controller/forums/forum_controller.dart';

class CommentProvider extends ChangeNotifier{

  void comment(BuildContext context, forumId, String comment){
    ForumController.postComment(context, forumId, text: comment);
    notifyListeners();
  }

}