import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/item/widget/text_box.dart';

class BottomSheetView extends StatelessWidget {
  final String imageBaseUrl = "https://lavie.orangedigitalcenteregypt.com";

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
        height: MediaQuery.of(context).size.height * 0.50 ,
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),

        child: Column(
          children: [

            Expanded(
              child: SizedBox(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  child: CachedNetworkImage(
                    imageUrl: "$imageBaseUrl${imageUrl}",

                    placeholder: (context, url) {
                      return Image.asset("assets/loading.gif");
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/placeholder.jpg",);
                    },
                    height: MediaQuery.of(context).size.height * 0.60 ,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),

            ///                                                     /Text View
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),

              child: TextBox(title: title,
                  description: description),
            )
          ],
        ),
      ),
    );
  }
}
