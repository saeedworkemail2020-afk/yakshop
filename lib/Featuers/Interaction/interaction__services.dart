import 'dart:convert';

import 'package:http/http.dart' as http;

class Interactionservices {
  void getdata() async {
    // var controller=Signcontroller();
    // var params = {"username": username, "password": password};
    try {
      //    var request= http.Request('GET',Uri.parse(uri));
      //    request.body=jsonEncode(params);
      //    request.headers['Content-Type']="application/json";
      //  var response=await http.Client().send(request);
      Uri uri = Uri.parse('https://e8f417133b1b.ngrok-free.app/health');
      print("++++++==========+++++++1");

      var response = await http.get(uri);
      print("++++++==========+++++++2");
      print(">>>${response.body}");
      var username = jsonEncode(response.body);
      print("++++++==========+++++++3");

      print(">>>${username}");
      print("++++++==========+++++++4");
      //  print(response.request);
    } catch (e) {
      print("++++++==========++++++33+");

      // print("exsption: $e");
    }
  }
}
