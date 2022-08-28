import 'package:flutter/material.dart';
import '../../../../data/controller/blogs/blog_controller.dart';
import '../../../../data/model/blogs/all_blogs_model.dart';
import 'blog_list_item.dart';

class BlogListView extends StatelessWidget {

  BlogListView({Key? key,}) : super(key: key);

  AllBlogsModel blogsModel = AllBlogsModel();

  Future<AllBlogsModel> getProducts(BuildContext context) async {

    try {
      blogsModel = await BlogController.getAllBlogs(context,);

    } catch (error) {
      print("Error: ${error}");
    }

    return blogsModel;
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: getProducts(context),

        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {

            return (blogsModel.data != null)

                ?  ListView.builder(
                itemCount: blogsModel.data!.plants!.length,

                itemBuilder: (context, index) {
                  return BlogListItem(
                    imageUrl: blogsModel.data!.plants![index].imageUrl!,
                    title: blogsModel.data!.plants![index].name!,
                    description: blogsModel.data!.plants![index].description!,
                    sunLight: blogsModel.data!.plants![index].sunLight!,
                    waterCapacity: blogsModel.data!.plants![index].waterCapacity!,
                    temperature: blogsModel.data!.plants![index].temperature!,
                  );
                }
            )
                :   const Center(child: CircularProgressIndicator(),);

          } else {
            return const Center(child: Text("There are no Blogs today.."),);
          }

        });
  }
}
