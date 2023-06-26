import 'dart:convert';
import 'package:fidelity_app/controllers/local_controller.dart';
import 'package:fidelity_app/services/general.dart';
import 'package:fidelity_app/utils/server_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fidelity_app/model/card.dart';

class CardService {

//   create new store :
// post /partner/store/create
// body : { name:"test store", sellsabeel_id : 1 }

   static Future<General<dynamic>> addCard(int storeId) async {

    // int parsedData = storeId as int;
    
    var data = {"store_id": storeId };
    print(data);
    
    var header = {
      'Content-Type': 'application/json',
      'cookie': LocalController.getToken()
    };

    try {
      http.Response response = await http.post(Uri.parse(urlAddCard),
          headers: header, body: jsonEncode(data));
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print("============================================");
        print(jsonData);
        
        return General<dynamic>(data: jsonData);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

 static Future<General<List<Cards>>> listClientCards() async {
    // var user = LocalController.getProfile();
    try {
      
      http.Response response = await http.get(Uri.parse(urlListCrads),
          headers: {'cookie': LocalController.getToken()});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        // print("===================================================");
        // print(jsonData["data"]);
        List<Cards> events = [];
        for (var item in jsonData["data"]) {
          events.add(Cards.fromJson(item));
        }
        print(events.length);
        return General<List<Cards>>(data: events);
      }
      return General<List<Cards>>(error: true);
    } on Exception catch (e) {
      return General<List<Cards>>(error: true);
    }
  }
}
