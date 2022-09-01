import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../../../data/controller/blogs/blog_controller.dart';
import '../../../data/model/blogs/blog_model.dart';
import '../../provider/scanner_provider.dart';
import '../bottom_sheet/screen/item_bottom_sheet_screen.dart';

class QrScannerScreen extends StatefulWidget {
  //Stateless leads to null, when refreshing screen

  QrScannerScreen({Key? key,}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  String? productId;

  BlogModel blogModel = BlogModel();

  Future<BlogModel> getProduct(BuildContext context) async {
    try {
      blogModel = await BlogController.getOneBlog(context, productId);

    } catch (error) {
      print("Error: ${error}");
    }

    return blogModel;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,

        children: [
          MobileScanner(
              controller: cameraController,
              allowDuplicates: false,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  print('Failed to scan Barcode');
                } else {
                  productId = barcode.rawValue!;
                  Provider.of<ScannerProvider>(context, listen: false).show();
                  print('Barcode found! $productId');
                }
              }),

          SvgPicture.asset(
            "assets/qr_code.svg",
            color: Colors.white54,
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.30,
          ),


          Consumer<ScannerProvider>(
              builder: (context, provider, child) {
                return (provider.openBottomSheet)

                    ? FutureBuilder(
                    future: getProduct(context),

                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ItemBottomSheet(
                          imageUrl: blogModel.data!.imageUrl!,
                          title: blogModel.data!.name!,
                          description: blogModel.data!.description!,
                          sunLight: blogModel.data!.sunLight!,
                          waterCapacity: blogModel.data!.waterCapacity!,
                          temperature: blogModel.data!.temperature!,);
                      } else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    })

                    : const SizedBox();
              }
          )
        ]
    );
  }
}
