import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/data/model/auth_model/auth_model.dart';
import 'package:la_vie_web/data/repository/auth_repository.dart';
import 'package:la_vie_web/presentation/view/register/screen/signup_view.dart';
import '../../common/tabs_widget.dart';
import 'login_view.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  List tabs = ["Sign Up", "Login"];


  signIn() async{
    AuthModel model;

    try {
      model = await AuthRepository().signIn("ziadhassan7@gmail.com", "1501Ziad");
      print("Reeeeeess: ${model.message}");

    } catch (e) {

      print("Reeeeeess: $e");
    }
  }


  static late TabController tabController;

  @override
  void initState() {
    super.initState();

    signIn();

    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();

    tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          color: Colors.white,

          child: SafeArea(

            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultTabController(
                    length: tabs.length,
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                          child: SvgPicture.asset("assets/lavie_logo.svg"),
                        ),

                        SizedBox(width: 500, child: Center(
                            child: TabsWidget(tabsList: tabs, isRegister: true, controller: tabController)
                        )),


                        registerView()
                      ],
                    ),

                  ),
              ),
              ),
          ),
        ),
    );
  }

  Widget registerView(){
    return Expanded(
            child: Container(
              width: 500,
              padding: const EdgeInsets.symmetric(vertical: 25),

              child: TabBarView(
                controller: tabController,

                children: [

                  SingleChildScrollView(child: SignupView(tabController: tabController,)),

                  SingleChildScrollView(child: LoginView(tabController: tabController,)),

                ],
              ),
          ),
    );
  }

}
