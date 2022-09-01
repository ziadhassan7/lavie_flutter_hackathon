import 'package:flutter/material.dart';
import '../widget/product_list_item.dart';

class ProductsView extends StatelessWidget {
  Future futureFunction;
  bool isProducts;

  ProductsView({Key? key, required this.futureFunction, required this.isProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,

      builder: (context, AsyncSnapshot snapshot) {

        if (snapshot.hasData){
            return (snapshot.data.allData.length != 0)
                ? GridView.builder(
                    itemCount: snapshot.data.allData.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 2 / 2.7,
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return ProductListItem(
                        data: snapshot.data.allData![index],
                        price: isProducts
                            ? snapshot.data.allData![index].price
                            : 0,
                      );
                    })
                : const Center(child: Text("No Products"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }

      }
    );
  }
}
