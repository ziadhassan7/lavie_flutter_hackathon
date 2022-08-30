import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/app_core/global_data.dart';
import 'package:la_vie_web/presentation/provider/like_provider.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/forum/data/nested/like_data.dart';

class ForumListItem extends StatelessWidget {
  String forumId;
  String userImage;
  String userName;
  String postTitle;
  String postBody;
  String? postImage;
  List<LikeData> likes;
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: TextPoppins(userName)
                      ),
                    ),
                  ],
                ),
              ),


              ///                                                             / Title
              TextPoppins(postTitle, size: 17, color: ColorConstants.accent,
                weight: FontWeight.w600,),

              ///                                                             / Body
              TextPoppins(postBody, color: ColorConstants.primaryLight),

              ///                                                             / Post Image
              postImage != null ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),

                child: Center(
                  child: CachedNetworkImage(
                    imageUrl:
                    "https://lavie.orangedigitalcenteregypt.com${postImage!}",

                    placeholder: (context, url) {
                      return Image.asset("assets/loading.gif");
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/placeholder.jpg",);
                    },
                  ),
                ),
              ) : const SizedBox(),

              ///                                                               / Bottom Row
              Row(
                children: [
                  likeButton(context),

                  const Spacer(),

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

  Widget likeButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: LikeButton(
        isLiked: initialLikeState(),
        circleColor:
        const CircleColor(start: Colors.lightGreen, end: ColorConstants.accent),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Colors.lightGreen,
          dotSecondaryColor: ColorConstants.accent,
        ),
        likeBuilder: (bool isLiked) {
          return isLiked ?
          const Icon(
            Icons.favorite,
            color: ColorConstants.accent,
            size: 30,
          )

              : const Icon(
            Icons.favorite_border,
            color: ColorConstants.primaryLight,
            size: 30,
          );
        },

        likeCount: likes.length,
        countBuilder: (likeCount, isLiked, text) {
          var color = isLiked ? ColorConstants.accent : Colors.grey;
          Widget result;
          if (likeCount == 0) {
            result = TextPoppins("first love", color: color,);
          } else {
            result = TextPoppins(text, color: color,);
          }
          return result;
        },

        likeCountAnimationDuration: const Duration(milliseconds: 300),

        onTap: ((isLiked) async{
          return Provider.of<LikeProvider>(context, listen: false).likePost(context, forumId, isLiked);
          //return isLiked;
        }),
      ),
    );
  }


  bool initialLikeState() {
    bool isUserLiked = false;

    for(var like in likes) {
      if(like.userId == GlobalData.userId){
        isUserLiked = true;
      }
    }

    print("oghsdfdfkdsfmsdkf ${GlobalData.userId}");

    return isUserLiked;
  }
}
