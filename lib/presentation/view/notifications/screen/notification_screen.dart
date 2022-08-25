import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/user/notification_controller.dart';
import 'package:la_vie_web/data/model/user/notifications/notification_model.dart';
import '../../common/text_poppins.dart';
import '../widget/notification_list_item.dart';

class NotificationScreen extends StatelessWidget {
  final String authKey;

  NotificationScreen({Key? key, required this.authKey}) : super(key: key);

  List<NotificationModel> data = [];

  Future<List<NotificationModel>> getNotifications(BuildContext context) async {

    try {
      data = await NotificationController.getNotifications(context, authKey,);

    } catch (error) {
      print("Error: ${error}");
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPoppins(
          "Notification", weight: FontWeight.w600, color: Colors.black87,),

        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
        shadowColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
      ),

      body: FutureBuilder(
        future: getNotifications(context),

        builder: (context, snapshot){
          if (snapshot.hasData) {

            return (data.isNotEmpty) ?

            ListView.separated(
              itemCount: data.length,

              itemBuilder: (context, index) {
                return NotificationListItem(
                  message: data[index].message!,
                  time: data[index].createdAt!
                );
              },

              separatorBuilder: (context, index) => const Divider(),
            )

            : const Center(child: CircularProgressIndicator(),);

          } else {
            return Center(child: TextPoppins("You have no notifications"),);
          }
        },
      ),
    );
  }
}
