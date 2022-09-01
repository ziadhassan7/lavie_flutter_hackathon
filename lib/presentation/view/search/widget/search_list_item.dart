import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class SearchListItem extends StatelessWidget {
  String itemName;

  SearchListItem({Key? key, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPoppins(itemName),

          const Divider(),
        ],
      ),
    );
  }
}
