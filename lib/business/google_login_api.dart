import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginApi {

  static final googleClient = GoogleSignIn();


  static Future login() async {
    try {
      await googleClient.signIn();
    } catch (error) {
      print(error);
    }
  }


}