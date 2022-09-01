import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/forums/forum_controller.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';
import 'package:la_vie_web/presentation/view/forum/screen/post_screen.dart';
import '../../../../data/controller/view_handler.dart';
import '../widget/forum_list_item.dart';

class ForumsView extends StatelessWidget {
  ForumsView({Key? key, required this.isAllForums}) : super(key: key);

  bool isAllForums;
  AllForumsModel model = AllForumsModel();


  Future<AllForumsModel> getData(BuildContext context) async {

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
      future: getData(context),
      builder: (context, snapshot) {

        if (snapshot.hasData) {

          if(model.data != null) {
            return model.data!.isNotEmpty ?

            ListView.builder(
                itemCount: model.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(

                    /// List Item click
                    onTap: () {
                      ViewHandler.navigateTo(context, PostScreen(
                        forumId: model.data![index].forumId!,
                        userName: getFullUserName(
                            model.data![index].user!.firstName!,
                            model.data![index].user!.lastName!),
                        ),
                        isReplace: false);
                    },

                    /// List Item
                    child: ForumListItem(
                      forumId: model.data![index].forumId!,
                      userImage: model.data![index].user!.imageUrl!,

                      userName: getFullUserName(
                          model.data![index].user!.firstName!,
                          model.data![index].user!.lastName!),

                      postTitle: model.data![index].title!,
                      postBody: model.data![index].description!,
                      postImage: model.data![index].imageUrl,
                      likes: model.data![index].forumLikes!,
                      comments: model.data![index].forumComments!,
                    ),
                  );
                })

                : const Center(child: Text("There are no posts"));


          } else {
            return const Center(child: Text("No Internet Connection"));
          }

        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }

  String getFullUserName (String firstName, String lastName){
    return "$firstName $lastName";
  }

}
