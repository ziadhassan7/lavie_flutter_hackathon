import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/bottom_sheet_provider.dart';
import '../../common/text_poppins.dart';
import '../../item/screen/item_bottom_sheet_screen.dart';
import '../widget/blog_list_view.dart';

class BlogsScreen extends StatelessWidget {
  String authKey;

  BlogsScreen({Key? key, required this.authKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///                                                                       /App Bar
        appBar: AppBar(
          title: TextPoppins(
            "Blogs", weight: FontWeight.w600, color: Colors.black87,),
          //green
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          toolbarHeight: 65,
          elevation: 0,
        ),

        body: Stack(
          children: [
            ///                                                                 /List of Blogs
            BlogListView(authKey: authKey,),

            ///                                                                 /Bottom Blog Sheet
            Consumer<BottomSheetProvider>(
              builder: (context, provider, child) {

                return (provider.isOpened)

                ? ItemBottomSheet(
                  imageUrl: provider.imageUrl!,
                  title: provider.title!,
                  description: provider.description!,
                  sunLight: provider.sunLight!,
                  waterCapacity: provider.waterCapacity!,
                  temperature: provider.temperature!,
                )

                : const SizedBox();
              },
            ),
          ],
        )

    );
  }
}
