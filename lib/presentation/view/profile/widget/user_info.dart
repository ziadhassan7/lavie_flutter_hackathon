import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/user/profile_controller.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class UserInfoSection extends StatelessWidget {
  String authKey;

  UserInfoSection({Key? key , required this.authKey}) : super(key: key);

  UserModel user = UserModel();

  Future<UserModel> getProfile(BuildContext context) async {

    try {
      user = await ProfileController.getUser(context, authKey,);

    } catch (error) {
      print("Error: ${error}");
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),

      child: FutureBuilder(
        future: getProfile(context),

        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return user.data != null

            ? TextPoppins(
                  "${user.data!.firstName!} ${user.data!.lastName!}",
                  size: 30,
                  weight: FontWeight.w600,
                  color: Colors.black87,
                )

            : const Center(child: CircularProgressIndicator(),);

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }

        }
      ),
    );
  }
}
