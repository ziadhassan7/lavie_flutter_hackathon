import 'package:flutter/material.dart';

import '../../common/text_poppins.dart';

class FloatingInfoBox extends StatelessWidget {
  IconData icon;
  String info;

  FloatingInfoBox(this.icon,{
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),

            child: TextPoppins(info, size: 22, color: Colors.white,),
          ),

          Container(
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Icon(icon, color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
