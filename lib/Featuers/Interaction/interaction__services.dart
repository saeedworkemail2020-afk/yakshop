import 'dart:convert';

import 'package:http/http.dart' as http;

class Interactionservices {
  void getdata() async {
    // var controller=Signcontroller();
    // var params = {"username": username, "password": password};
    //  const  uri="http://saeedapk.ir/api/user/login";
    try {
      //    var request= http.Request('GET',Uri.parse(uri));
      //    request.body=jsonEncode(params);
      //    request.headers['Content-Type']="application/json";
      //  var response=await http.Client().send(request);
      var uri = Uri.parse("http://saeedapk.ir/api/user/login");
      var response = (await http.get(uri));
      var username = jsonDecode(response.body);
      print(username);
      print("++++++==========+++++++");
      //  print(response.request);
    } catch (e) {
      print("exsption: $e");
    }
  }
}
