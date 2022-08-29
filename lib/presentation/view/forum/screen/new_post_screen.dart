import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/forums/forum_controller.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/presentation/view/common/user_input.dart';
import 'package:la_vie_web/presentation/view/register/widget/button_accent.dart';
import 'package:provider/provider.dart';
import '../../../provider/picked_image_provider.dart';
import '../../common/text_poppins.dart';
import '../widget/image_square_widget.dart';

class NewPostScreen extends StatelessWidget {
  static String base64Image = "";

  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPoppins(
          "Create New Post", weight: FontWeight.w600, color: Colors.black87,),

        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
        shadowColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Column(
                  children: [

                    const ImageSquareWidget(),

                    UserInput(
                        label: "Title",
                        isPassword: false,
                        textController: ForumController.titleController,
                        isExpanded: false
                    ),

                    UserInput(
                        label: "Description",
                        isPassword: false,
                        textController: ForumController.bodyController,
                        isExpanded: true
                    ),
                  ],
                ),


            /// Post Button
            Padding(
                padding: const EdgeInsets.all(10),

                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.90,

                  child: ButtonAccent("Post",
                      onPressed: () => post(context)),
                )
            ),
          ],
        ),
      ),
    );
  }

  void post (BuildContext context) {
    ForumController.postForum(context, image: base64Image);

    ViewHandler.showSnackBar(context, "Post Added!");

    Navigator.pop(context);

    Provider.of<PickedImageProvider>(context, listen: false).reset();
  }
}
