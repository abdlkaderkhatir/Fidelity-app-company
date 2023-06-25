import 'dart:convert';
import 'package:fidelity_app/controllers/local_controller.dart';
import 'package:fidelity_app/services/general.dart';
import 'package:http/http.dart' as http;

class CardService {

   static Future<General<String>> addCard(int store_id) async {
    
     Map<String, dynamic> body = {
      "store_id": store_id,
    };
    
    var header = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      // 'x-access-token': LocalController.getToken()
      // "cookie" : "authorization=........."
    };

    try {
      http.Response response = await http.post(Uri.parse(""),
          headers: header, body: json.encode(body));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

 static Future<General<List<String>>> listClientCards() async {
    // var user = LocalController.getProfile();
    try {
      // String url = urlSavedEvent + "${user.idClient}/savedEvents";
      http.Response response = await http.get(Uri.parse(""),
          headers: {'x-access-token': LocalController.getToken()});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<String> events = [];
        for (var item in jsonData["data"]) {
          // events.add(EventModel.fromJson(item));
        }
        print(events.length);
        return General<List<String>>(data: events);
      }
      return General<List<String>>(error: true);
    } on Exception catch (e) {
      return General<List<String>>(error: true);
    }
  }
}
