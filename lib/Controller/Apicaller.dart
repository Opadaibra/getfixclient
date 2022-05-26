import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Apicaller {
  getrequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Errore catch $e");
    }
  }

  postrequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
        
      }
    } catch (e) {
      print("Errore catch $e");
    }
  }

  String server_url = "https://jsonplaceholder.typicode.com/comments";
  var statues;

  var token;

  logindata(String name, String email) async {
    String myUrl = "$server_url";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }, body: {
      "name": "$name",
      "email": "$email"
    });
    statues = response.body.contains('error');
    var data = jsonDecode(response.body);
    if (statues)
      print('data: ${data["error"]}');
    else {
      print('token: ${data["token"]}');
      // _save(data["token"]);
    }
  }
/*
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }*/
}
