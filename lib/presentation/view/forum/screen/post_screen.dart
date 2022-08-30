import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';
import '../../../../data/controller/forums/forum_controller.dart';
import '../../common/text_poppins.dart';
import '../widget/forum_list_item.dart';

class PostScreen extends StatelessWidget {
  String forumId;
  String userName;

  PostScreen({
    Key? key,
    required this.forumId,
    required this.userName,
  }) : super(key: key);


  ForumModel model = ForumModel();


  Future<ForumModel> getData(BuildContext context) async {

    try {
      model = await ForumController.getOneForum(context, forumId: forumId);
    } catch (error) {
      print("Error: ${error}");
    }

    return model;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///                                                                       /AppBar
      appBar: AppBar(
        title: TextPoppins(
          userName, weight: FontWeight.w600, color: Colors.black87,),

        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
        shadowColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData){
                return Column(
                  children: [
                    ForumListItem(
                      forumId: model.data!.forumId!,
                      userImage: model.data!.user!.imageUrl!,
                      userName: userName,
                      postTitle: model.data!.title!,
                      postBody: model.data!.description!,
                      postImage: model.data!.imageUrl!,
                      likes: model.data!.forumLikes!,
                      comments: model.data!.forumComments!,
                    ),

                  ],
                );

            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        ),
      ),

    );
  }
}
