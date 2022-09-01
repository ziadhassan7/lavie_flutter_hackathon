import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/presentation/view/blog_item/widget/blog_item_view.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/blogs/screen/blogs_screen.dart';
import 'package:la_vie_web/presentation/view/register/widget/button_accent.dart';

class BottomSheetView extends StatelessWidget {

  String imageUrl;
  String title;
  String description;

  BottomSheetView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,

      child: Container(


        decoration: const BoxDecoration(
          color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),

        child: Column(
          children: [

            BlogItemView(
              imageUrl: imageUrl,
              title: title,
              description: description,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: ButtonAccent(
                  "Go to Blogs",
                  onPressed: () => ViewHandler.navigateTo(context, BlogsScreen(),
                      isReplace: false)),
            ),
          ],
        )
      ),
    );
  }
}
