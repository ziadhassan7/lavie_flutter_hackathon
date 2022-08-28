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
                return CircleAvatar(
                    radius: 100, //size

                    backgroundImage: NetworkImage(imageUrl)
                );

              } else {
                return const Center(child: CircularProgressIndicator(),);
              }

            }),
      ),
    );
  }
}
