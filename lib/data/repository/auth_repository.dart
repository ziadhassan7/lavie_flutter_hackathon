import 'package:dio/dio.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/data/model/auth_model/post_model/post_auth.dart';
import 'package:la_vie_web/business/dio_exception.dart';

import '../model/auth_model/auth_model.dart';

class AuthRepository {

  DioClient dio = DioClient();
  final signinEndpoint = "/api/v1/auth/signin";
  final signupEndpoint = "/api/v1/auth/signup";

  Future<AuthModel> signIn(String email, String password) async {

    try {
      Response response = await dio.post(
        signinEndpoint,
        data: PostAuth(email: email, password: password).toJson(),
      );
      return AuthModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthModel> signUp(
      String firstName, String lastName, String email, String password) async {

    try {
      Response response = await dio.post(
        signupEndpoint,
        data: PostAuth(
                firstName: firstName,
                lastName: lastName,
                email: email,
                password: password)
            .toJson(),
      );
      return AuthModel.fromJson(response.data);

    } on DioError catch (e) {

      if (e.response?.statusCode == 400) {
        List list = e.response?.data['message'];

        String errorMessage = "";

        for (var element in list) {
          errorMessage = "$errorMessage* $element\n\n";
        }

        throw errorMessage.trimRight();
      }

      rethrow;
      }
  }
}
