import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:integration_with_loc/models/welcome_model.dart';

class welcomeProvider extends ChangeNotifier {
  static const apiEndPoint = 'https://api.publicapis.org/entries';

  bool isLoading = true;
  String error = '';
  Welcome welcome = Welcome(count: [].length,entries: []);

  getDataFromAPI() async{
    try {
      Response response = await http.get(Uri.parse(apiEndPoint));
      if (response.statusCode ==200){
        welcome = welcomeFromJson(response.body);
      }else{
        error = response.statusCode.toString();
      }
    }catch(e){
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}