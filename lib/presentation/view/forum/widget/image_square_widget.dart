import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie_web/presentation/provider/picked_image_provider.dart';
import 'package:provider/provider.dart';
import '../../../../app_core/color_constants.dart';
import '../../common/text_poppins.dart';
import '../screen/new_post_screen.dart';

class ImageSquareWidget extends StatelessWidget {
  static const Color colorAccent = ColorConstants.accent;

  const ImageSquareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      ///                                                                       /Handle System Back
      ///                                                                       /Reset providers
      onWillPop: () {
        Provider.of<PickedImageProvider>(context, listen: false).reset();

        return Future.value(true);
      },


      child: Consumer<PickedImageProvider>(
        builder: (context, provider, child) {
          return InkWell(
            onTap: () => pickImage(provider),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),

              child:
              provider.isPicked ?

              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.file(provider.pickedImage!),
              )

              : Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0,
                      color: colorAccent
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),


                child: Column(
                  children: [
                    const Icon(Icons.add, color: colorAccent,),

                    TextPoppins("Add Photo", color: colorAccent,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> pickImage(PickedImageProvider provider) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    final bytes = File(image!.path).readAsBytesSync();

    NewPostScreen.base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    provider.viewPickedImage(File(image.path));
  }
}
