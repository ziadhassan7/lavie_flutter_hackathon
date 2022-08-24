import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/provider/scanner_provider.dart';
import 'package:la_vie_web/presentation/view/item/widget/bottom_sheet_view.dart';
import 'package:la_vie_web/presentation/view/item/widget/text_box.dart';
import 'package:provider/provider.dart';
import '../../../provider/bottom_sheet_provider.dart';
import '../../common/text_poppins.dart';
import '../widget/floating_info_box.dart';

class ItemBottomSheet extends StatelessWidget {

  String imageUrl;
  String title;
  String description;
  int sunLight;
  int waterCapacity;
  int temperature;

  ItemBottomSheet({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.sunLight,
    required this.waterCapacity,
    required this.temperature,
  }) : super(key: key);

  void dismissBottomSheet(BuildContext context){
    Provider.of<BottomSheetProvider>(context, listen: false).dismiss();
    Provider.of<ScannerProvider>(context, listen: false).dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      ///                                                                       /Handle System Back
      ///                                                                       /Navigation
      onWillPop: () {
        dismissBottomSheet(context);

        return Future.value(false);
      },

      child: InkWell(
        //dismiss when tap on empty area
        onTap: ()=> dismissBottomSheet(context),

        child: Container(
          ///                                                                   /Shadow Color
          color: Colors.black38,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [

                ///                                                             /Top Row Widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    FloatingInfoBox(Icons.sunny, info: "$sunLight％"),
                    FloatingInfoBox(Icons.water_drop, info: "$waterCapacity％"),
                    FloatingInfoBox(Icons.thermostat, info:"$temperature°c"),
                  ],
                ),

                ///                                                             /Bottom Sheet
                SingleChildScrollView(
                  child: BottomSheetView(
                    imageUrl: imageUrl,
                    title: title,
                    description: description,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
