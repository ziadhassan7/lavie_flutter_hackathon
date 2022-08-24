import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_web/app_core/color_constants.dart';

class TabsWidget extends StatelessWidget {
  final List tabsList;
  final bool isRegister;
  final TabController? controller;

  const TabsWidget({
    Key? key,
    this.controller,
    required this.tabsList,
    required this.isRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: isRegister? false : true,

      padding: const EdgeInsets.only(top: 14, bottom: 8, left: 8, right: 8,),
      labelPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      indicatorSize: isRegister? TabBarIndicatorSize.label : null,
      indicator: getIndicator(),

      labelColor: ColorConstants.accent,
      unselectedLabelColor: Colors.black38,
      labelStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),

      tabs: [
        for (final tab in tabsList) Text(tab)
      ],
    );
  }

  getIndicator(){
    if(isRegister){
      //UnderLined for RegisterPage
      return const UnderlineTabIndicator(
          borderSide: BorderSide(color: ColorConstants.accent, width: 3));

    } else {
      //Rounded for HomePage
      return const ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.accent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      );
    }

  }
}
