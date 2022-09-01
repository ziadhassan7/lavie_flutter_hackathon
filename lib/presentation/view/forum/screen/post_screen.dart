import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';
import 'package:la_vie_web/presentation/view/forum/widget/comment_list_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/controller/forums/forum_controller.dart';
import '../../../provider/comment_provider.dart';
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

      body: Column(
        children: [

          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Consumer<CommentProvider>(
                  builder: (context, provider, child) {
                  return FutureBuilder(
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

                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.11 * model.data!.forumComments!.length,

                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(), //disable scroll behavior of listView
                                    itemCount: model.data!.forumComments!.length,
                                    itemBuilder: (context, index) {
                                      return CommentListItem(
                                        userId: model.data!.forumComments![index].userId!,
                                        comment: model.data!.forumComments![index].comment!,
                                        time: model.data!.forumComments![index].createdAt!,);
                                    }),
                              )
                            ],
                          );

                      } else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    }
                  );
                },
              ),),
            ),
          ),


          bottomSendBar(context),
        ],
      ),

    );
  }

  Widget bottomSendBar(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

      child: Row(
        children: [
          Expanded(

            ///                                                           /TextFormField -
            ///                                                           text field for typing your message
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),

              child: TextFormField(
                controller: ForumController.commentController,
                decoration: const InputDecoration(
                    hintText: "Write a comment.."
                ),

              ),
            ),
          ),

                ///                                                             /Send Button -
                ///                                                             sends a new message
          InkWell(
            onTap: () => Provider.of<CommentProvider>(context, listen: false)
                .comment(context, forumId),

            child: const Icon(Icons.send, color: ColorConstants.accent, size: 25,))
        ],
      ),
    );
  }
}
