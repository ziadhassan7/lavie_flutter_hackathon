import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/presentation/view/forum/screen/forums_view.dart';
import 'package:la_vie_web/presentation/view/forum/screen/new_post_screen.dart';
import '../../../../app_core/color_constants.dart';
import '../../common/tabs_widget.dart';
import '../../common/text_poppins.dart';

class ForumIndexScreen extends StatelessWidget {
  ForumIndexScreen({Key? key}) : super(key: key);

  List tabs = ["All Forums", "My Forums"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///                                                                       /AppBar
      appBar: AppBar(
        title: TextPoppins(
          "Community Forums", weight: FontWeight.w600, color: Colors.black87,),

        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
        shadowColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
      ),

      ///                                                                       /Body
      body: DefaultTabController(
        length: tabs.length,

        child: Column(
          children: [
            /// TabBar
            TabsWidget(
              tabsList: tabs, isRegister: false,
            ),

            /// TabView
            tabsView(context)
          ],
        ),),

      ///                                                                       /Action Button (new post)
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        backgroundColor: ColorConstants.accent,

        onPressed: () { ViewHandler.navigateTo(context, const NewPostScreen(), isReplace: false); },

        child: const Icon(Icons.add),
      ),
    );
  }


  Widget tabsView(BuildContext context){
    return Expanded(
      child: SizedBox(
        child: TabBarView(
          controller: null,

          children: [
            //All
            ForumsView(isAllForums: true),

            //My
            ForumsView(isAllForums: false),
          ],
        ),
      ),
    );
  }
}
