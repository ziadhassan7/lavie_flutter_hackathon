import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';
import '../../../../data/controller/time/time_handler.dart';

class CommentListItem extends StatelessWidget {
  String userId;
  String comment;
  String time;

  CommentListItem({Key? key,
    required this.userId,
    required this.comment,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextPoppins(comment, size: 17,),
            )),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextPoppins(
              TimeHandler.getFormattedTime(time),
              size: 10, color: ColorConstants.primaryLight,),
          ),
        ],
      ),
    );
  }
}
