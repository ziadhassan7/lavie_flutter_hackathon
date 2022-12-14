import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/app_core/hive_keys.dart';
import 'package:la_vie_web/presentation/provider/bottom_sheet_provider.dart';
import 'package:la_vie_web/presentation/provider/cart_provider.dart';
import 'package:la_vie_web/presentation/provider/auth_provider.dart';
import 'package:la_vie_web/presentation/provider/comment_provider.dart';
import 'package:la_vie_web/presentation/provider/like_provider.dart';
import 'package:la_vie_web/presentation/provider/navigation_bar_provider.dart';
import 'package:la_vie_web/presentation/provider/picked_image_provider.dart';
import 'package:la_vie_web/presentation/provider/scanner_provider.dart';
import 'package:la_vie_web/presentation/provider/search_provider.dart';
import 'package:la_vie_web/presentation/view/index/index_screen.dart';
import 'package:la_vie_web/presentation/view/register/screen/register_screen.dart';
import 'package:provider/provider.dart';
import 'app_core/global_data.dart';
import 'data/shared_pref/hive_util.dart';


void main() async{
  //Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(GLOBAL_DATA_BOX);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Widget startScreen;

  @override
  void initState() {
    super.initState();

    ///Decide what screen to show to the user at start
    HiveUtil hive = HiveUtil();

    if(hive.getAuth() != null) {
      GlobalData.setGlobalAuth(hive.getAuth());
      GlobalData.setGlobalUserId(hive.getUserId());
      startScreen = const IndexScreen();
    } else {
      startScreen = RegisterScreen();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BottomSheetProvider()),
        ChangeNotifierProvider(create: (context) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => ScannerProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => PickedImageProvider()),
        ChangeNotifierProvider(create: (context) => LikeProvider()),
        ChangeNotifierProvider(create: (context) => CommentProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],

      child: MaterialApp(
        title: 'La Vie',

        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ColorConstants.accent
          ),

          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorConstants.accent,
            selectionColor: Colors.greenAccent,
            selectionHandleColor: Colors.black,
          ),
        ),

        home: startScreen,
      ),
    );
  }
}
