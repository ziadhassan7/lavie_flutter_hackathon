import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/view/blog_item/widget/blog_item_view.dart';
import '../../bottom_sheet/widget/floating_info_box.dart';
import '../../common/text_poppins.dart';

class BlogItemScreen extends StatelessWidget {
  String imageUrl;
  String title;
  String description;
  int sunLight;
  int waterCapacity;
  int temperature;

  BlogItemScreen({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.sunLight,
    required this.waterCapacity,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPoppins(
          title, weight: FontWeight.w600, color: Colors.black87,),

        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
        shadowColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
      ),

      body: Column(
        children: [

          BlogItemView(
            imageUrl: imageUrl,
            title: title,
            description: description,
          ),

          ///                                                                   /Info Row Widgets
          Padding(
            padding: const EdgeInsets.all(10),

            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.primaryLight,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  FloatingInfoBox(Icons.sunny, info: "$sunLight％"),
                  FloatingInfoBox(Icons.water_drop, info: "$waterCapacity％"),
                  FloatingInfoBox(Icons.thermostat, info:"$temperature°c"),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
