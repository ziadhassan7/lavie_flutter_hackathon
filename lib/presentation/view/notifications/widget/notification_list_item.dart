import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/time/time_handler.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class NotificationListItem extends StatelessWidget {
  String message;
  String time;

  NotificationListItem({
    Key? key,
    required this.message,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextPoppins(
              message,
              weight: FontWeight.w600,
          ),

          TextPoppins(
            TimeHandler.getFormattedTime(time),
            weight: FontWeight.w400,
            size: 12,
          ),
        ],
      ),
    );
  }




}
