import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/bottom_sheet/widget/text_box.dart';

class BlogItemView extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

  BlogItemView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imageBaseUrl = "https://lavie.orangedigitalcenteregypt.com";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Center(
                child: CachedNetworkImage(
                  imageUrl: "$imageBaseUrl${imageUrl}",

                  placeholder: (context, url) {
                    return Image.asset("assets/loading.gif");
                  },
                  errorWidget: (context, url, error) {
                    return Image.asset("assets/placeholder.jpg",);
                  },
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.80,
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
    );
  }
}
