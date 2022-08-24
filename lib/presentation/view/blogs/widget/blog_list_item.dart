import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/provider/bottom_sheet_provider.dart';
import 'package:la_vie_web/presentation/view/item/widget/text_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class BlogListItem extends StatelessWidget {
  final String imageBaseUrl = "https://lavie.orangedigitalcenteregypt.com";

  String imageUrl;
  String title;
  String description;
  int sunLight;
  int waterCapacity;
  int temperature;

  BlogListItem({
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
    return Padding(
      padding: const EdgeInsets.all(10),

      child: InkWell(

        onTap: () => Provider.of<BottomSheetProvider>(context, listen: false).show(
          imageUrl: imageUrl,
          title: title,
          description: description,
          sunLight: sunLight,
          waterCapacity: waterCapacity,
          temperature: temperature,
        ),

        child: Card(
          elevation: 3,
          shadowColor: Colors.white,

          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: "$imageBaseUrl${imageUrl}",
                    placeholder: (context, url) => Image.asset("assets/loading.gif"),
                    errorWidget: (context, url, error) {
                        return Image.asset("assets/placeholder.jpg", );
                    },
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                  ),
                ),


                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: TextBox(title: title, description: description))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
