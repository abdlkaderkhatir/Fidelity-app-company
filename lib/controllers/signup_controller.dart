import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
 
  late RxString birthDateController = "".obs;

  late var tokenNotification;


 

  
  
  // @override
  // void onInit() async {
  //   // getTokenNotification();
  //   super.onInit();
  // }


  // getTokenNotification(){
  //   fbm.getToken().then((token) {
  //     tokenNotification = token;
  //   });
  // }

  

  // String? validateDate(String? date){
  //   if(validateName("") == null && validateLastName("") == null){
  //     if(birthDateController.isEmpty){
  //       return "birthdate_req".tr;
  //     }
  //   }
  //   return null;
  // }

  void changeDate(DateTime dateTime) {
    final DateTime date= dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    birthDateController.value = formatted.toString();
  }

  var isUpdating = false.obs;

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }

  
}
