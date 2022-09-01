import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/product/product_controller.dart';
import 'package:la_vie_web/data/model/products/products_model/all_product_model.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';
import 'package:la_vie_web/presentation/view/search/widget/search_list_item.dart';
import 'package:provider/provider.dart';
import '../../../provider/search_provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  Set<String> itemsWithNoDuplicates = {};

  bool isIdentical = false;

  TextEditingController searchController = TextEditingController();

  AllProductsModel model = AllProductsModel();

  Future<AllProductsModel> getProducts(BuildContext context) async {
    try {
      model = await ProductController.getAllProducts(context,);
    } catch (error) {
      print("Error: ${error}");
    }

    return model;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [

              ///                                                                   /Search bar (TextField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),

                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                      hintText: "Search"
                  ),

                  onChanged: (searched) =>
                  {
                    Provider.of<SearchProvider>(context, listen: false)
                        .updateSearchItems(searched)
                  },
                ),
              ),


              FutureBuilder(
                future: getProducts(context),

                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: SizedBox(
                        child: Consumer<SearchProvider>(
                          builder: (context, provider, child) {

                            //get items with no duplicates
                            for (var item in model.allData!) {
                              itemsWithNoDuplicates.add(item.name!);
                            }

                            //ListView of items
                            return ListView.builder(
                              itemCount: itemsWithNoDuplicates.length,
                              itemBuilder: (context, index) {

                                //does it contain what the user has written?
                                return itemsWithNoDuplicates.elementAt(index).toLowerCase().contains(
                                    provider.searchedText.toLowerCase()) ?

                                    SearchListItem(
                                        itemName: itemsWithNoDuplicates.elementAt(index)
                                    )
                                    : const SizedBox();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Center(
                        child: TextPoppins("No items"));
                  }
                },)

            ],
          ),
        )
    );
  }
}
