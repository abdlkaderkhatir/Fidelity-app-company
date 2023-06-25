import 'dart:convert';
import 'dart:math';
import 'package:fidelity_app/model/registration.dart';
import 'package:fidelity_app/services/general.dart';
import 'package:fidelity_app/utils/server_data.dart';
import 'package:http/http.dart';

class AuthService {
  static Future<General<String>> login(
      String email, String password, String tokenNotification) async {
    try {
      Response response = await post(Uri.parse(urlLogin), body: {
        "email": email,
        "password": password,
        "fcm_token": tokenNotification
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(
            data: response.body, token: jsonData["data"]["token"]);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      print(e);
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> signUp(RegistrationModel registration) async {
    try {
      print(registration.toString());

      Response response = await post(Uri.parse(urlSignup), body: 
      {
        "idToken": registration.idToken.toString(),
        "name": registration.name.toString(),
        "email": registration.email.toString(),
        "birth_date": registration.birthDay.toString(),
        "gender": registration.gender.toString(),
      });

      print(response.statusCode);

      if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        print( "===============================================================");
        print(jsonData);
        print("===============================================================");
        // return General<String>(data: jsonData["data"]["token"]);
      } else
      
      if (response.statusCode == 409) {
        return General<String>(
            data: "", error: true, errorMessage: "account_exist");
      } else if (response.statusCode == 422) {
        return General<String>(
            data: "", error: true, errorMessage: "check_informations");
      }
      return General<String>(data: "", error: true, errorMessage: "try");
    } on Exception catch (e) {
      return General<String>(data: "", error: true, errorMessage: "try");
    }
  }

  // static Future<General<String>> verifyCode(
  //     String email, String? token, String code,String tokenNot) async {
  //   try {
  //     http.Response response = await http.post(Uri.parse(urlVerifyCode),
  //         headers: {'x-access-token': token ?? ""},
  //         body: {'email': email, 'code': code,"fcm_token": tokenNot});
  //     if (response.statusCode == 200) {
  //       var jsonData = jsonDecode(response.body);
  //       return General<String>(
  //           data: response.body, token: jsonData["data"]["token"]);
  //     }
  //     return General<String>(data: "", error: true);
  //   } on Exception catch (e) {
  //     return General<String>(data: "", error: true);
  //   }
  // }
}
