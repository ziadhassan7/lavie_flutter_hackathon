import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/user/profile_controller.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';

class UserImageSection extends StatelessWidget {
  UserImageSection({Key? key,}) : super(key: key);

  String imageUrl = "";

  Future<String> getUserImage(BuildContext context) async {

    try {
      UserModel userModel = await ProfileController.getUser(context);
      imageUrl = userModel.data!.imageUrl!;

    } catch (error) {
      print("Error: ${error}");
    }

    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),

        child: FutureBuilder(
            future: getUserImage(context),

            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(1000),

                  child: CachedNetworkImage(
                    imageUrl: imageUrl,

                    placeholder: (context, url) {
                      return Image.asset("assets/loading.gif");
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/loading.gif",);
                    },
                    height: 250,
                    width: 230,
                    fit: BoxFit.fitHeight,
                  ),
                );

              } else {
                return const Center(child: CircularProgressIndicator(),);
              }

            }),
      ),
    );
  }
}
