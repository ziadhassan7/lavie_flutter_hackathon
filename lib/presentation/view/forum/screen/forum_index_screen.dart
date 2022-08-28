import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/forum/screen/forums_view.dart';

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
