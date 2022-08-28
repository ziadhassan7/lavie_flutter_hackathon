import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/presentation/view/home/screen/products_view.dart';
import 'package:la_vie_web/presentation/view/home/widget/cart_icon.dart';
import 'package:la_vie_web/presentation/view/home/widget/search_bar.dart';
import '../../../../data/controller/product/product_controller.dart';
import '../../common/tabs_widget.dart';

class HomeScreen extends StatelessWidget {
   List tabs = ["All", "Plants", "Seeds", "Tools"];

   HomeScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: SafeArea(
         child: Column(
           children: [
             ///                                                                /Logo
             Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 23, bottom: 16),

              child: SvgPicture.asset("assets/lavie_logo.svg"),
             ),


             ///                                                                /Search & Cart
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),

               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: const [

                  SearchBar(),

                  CartIcon()

                ],
            ),
             ),

            ///
             Expanded(
               child: SizedBox(
                 child: Expanded(
                   child: DefaultTabController(
                     length: tabs.length,

                     child: Column(
                       children: [
                         ///                                                    /TabBar
                        TabsWidget(
                          tabsList: tabs, isRegister: false,
                        ),

                        ///                                                     /TabView
                         tabsView(context)
                       ],
                     ),),
                 ),
               ),
             )
          ],),
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
               ProductsView(
                 futureFunction: ProductController.getAllProducts(context),
                 isProducts: true,),

               //Plants
               ProductsView(
                 futureFunction: ProductController.getAllPlants(context),
                 isProducts: false,),

               //Seeds
               ProductsView(
                 futureFunction: ProductController.getAllSeeds(context),
                 isProducts: false,),

               //Tools
               ProductsView(
                 futureFunction: ProductController.getAllTools(context),
                 isProducts: false,),
             ],
           ),
       ),
     );
   }

}
