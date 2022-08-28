import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/forums/forum_controller.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';

import '../widget/forum_list_item.dart';

class ForumsView extends StatelessWidget {
  ForumsView({Key? key, required this.isAllForums}) : super(key: key);

  bool isAllForums;
  AllForumsModel model = AllForumsModel();


  Future<AllForumsModel> getDate(BuildContext context) async {

    try {
      model = isAllForums ?
          await ForumController.getAllForums(context,)
          : await ForumController.getMyForums(context,);

    } catch (error) {
      print("Error: ${error}");
    }

    return model;
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getDate(context),
      builder: (context, snapshot) {

        if (snapshot.hasData) {

          return model.data != null ?

          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {

              return ForumListItem(
                forumId: model.data![index].forumId!,
                userImage: model.data![index].user!.imageUrl!,

                userName: getFullUserName(
                    model.data![index].user!.firstName!,
                    model.data![index].user!.firstName!),

                postTitle: model.data![index].title!,
                postBody: model.data![index].description!,
                postImage: model.data![index].imageUrl,
                likes: model.data![index].forumLikes!,
                comments: model.data![index].forumComments!,
              );
          })

          : const Center(child: CircularProgressIndicator(),);

        } else {
          return const Center(child: Text("There are currently no posts"));
        }
      }
    );
  }

  String getFullUserName (String firstName, String lastName){
    return "$firstName $lastName";
  }

}
