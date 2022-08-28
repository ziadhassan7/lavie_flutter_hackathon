import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/profile/widget/user_image_section.dart';
import 'package:la_vie_web/presentation/view/profile/widget/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.green[400],

      child: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),

          child: Column(
            children: [

              UserImageSection(),

              UserInfoSection()
            ],
          ),
        ),
      ),
    );
  }
}
