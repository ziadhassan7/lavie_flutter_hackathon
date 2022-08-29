import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class ForumListItem extends StatelessWidget {
  String forumId;
  String userImage;
  String userName;
  String postTitle;
  String postBody;
  String? postImage;
  List likes;
  List comments;

  ForumListItem({
    Key? key,
    required this.forumId,
    required this.userImage,
    required this.userName,
    required this.postTitle,
    required this.postBody,
    this.postImage,
    required this.likes,
    required this.comments
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///                                                               /User (Image & Name)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),

                child: Row(
                  children: [
                    /// User Image
                    CircleAvatar(
                      radius: 30, //size

                      backgroundImage: NetworkImage(userImage)
                    ),

                    /// User Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),

                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: TextPoppins(userName)
                      ),
                    ),
                  ],
                ),
              ),


              ///                                                               /Title
              TextPoppins(postTitle, size: 17, color: ColorConstants.accent,
                weight: FontWeight.w600,),

              ///                                                               /Body
              TextPoppins(postBody, color: ColorConstants.primaryLight),

              ///                                                               /Post Image
              postImage != null ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),

                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: "https://lavie.orangedigitalcenteregypt.com${postImage!}",

                    placeholder: (context, url) {
                      return Image.asset("assets/loading.gif");
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/placeholder.jpg",);
                    },
                  ),
                ),
              ) : const SizedBox(),

              ///                                                               /Likes
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),

                    child: bottomTextWidget(likes.length.toString(), "Likes"),
                  ),

                  bottomTextWidget(comments.length.toString(), "Comments"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTextWidget(String value, String leadingTitle) {

    return TextPoppins(
      "$value $leadingTitle",
      size: 13,
    );
  }
}
