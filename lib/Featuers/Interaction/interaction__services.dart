import 'dart:convert';

import 'package:amozeshyar/Featuers/Interaction/Services/service_stok.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Interactionservices {
  RxString milk = "0".obs;
  RxString skins = "0".obs;

  String baseuri;
  Interactionservices(this.baseuri);
  Future getstock({required days}) async {
    try {
      Uri uri = Uri.parse("$baseuri$days");
      print("======started======>");
      var response = await http.get(uri);

      var result = jsonDecode(response.body);
      milk.value = ServiceStok(amount: result).milk.toString();
      skins.value = ServiceStok(amount: result).skins.toString();
      print("<====ended========");
    } catch (e) {
      print("<======+++erorr+++======");

      print(e);
    }
  }
}
