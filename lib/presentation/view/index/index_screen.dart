import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/view/qr_scanner/QrScannerScreen.dart';
import 'package:provider/provider.dart';
import '../../provider/navigation_bar_provider.dart';
import '../blogs/screen/blogs_screen.dart';
import '../home/screen/home_screen.dart';
import '../notifications/screen/notification_screen.dart';
import '../profile/screen/profile_screen.dart';

class IndexScreen extends StatefulWidget {
  final String authKey;

  const IndexScreen({Key? key, required this.authKey}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<NavigationBarProvider>(
        builder: (context, provider, child) {

          return IndexedStack(
              index: NavigationBarProvider.screenIndex,
              children: [
                BlogsScreen(authKey: widget.authKey),
                QrScannerScreen(authKey: widget.authKey),
                HomeScreen(authKey: widget.authKey),
                NotificationScreen(authKey: widget.authKey),
                ProfileScreen(authKey: widget.authKey),
              ]
          );
        },
      ),

      bottomNavigationBar: CurvedNavigationBar(
        index: NavigationBarProvider.screenIndex,
        color: Colors.white,
        buttonBackgroundColor: ColorConstants.accent,
        backgroundColor: const Color(0xFFF8F8F8),
        animationDuration: const Duration(milliseconds: 400),

        items: <Widget>[
          getStyledIcon("assets/leaf.svg", 0),
          getStyledIcon("assets/qr_code.svg", 1),
          getStyledIcon("assets/home.svg", 2),
          getStyledIcon("assets/notification.svg", 3),
          getStyledIcon("assets/profile.svg", 4),
        ],

        onTap: (index) {
          //Handle button tap
          setState(() {
            Provider.of<NavigationBarProvider>(context, listen: false).navigateTo(index);
          });
        },
      ),
    );
  }


  getStyledIcon(String path, int index) {
    print("reeeeee $index");


    return SvgPicture.asset(
      path,
      color: NavigationBarProvider.screenIndex == index ? Colors.white : Colors.black,
    );
  }
}
