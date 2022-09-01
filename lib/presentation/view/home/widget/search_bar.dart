import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/presentation/view/search/screen/search_screen.dart';

import '../../../../data/controller/view_handler.dart';
import '../../common/text_poppins.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),

        child: InkWell(
          onTap: ()=> ViewHandler.navigateTo(context, SearchScreen(),
              isReplace: false),

          child: Container(
            width: 200,

            decoration: const BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),

            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/search.svg"),
                ),

                TextPoppins("Search")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
