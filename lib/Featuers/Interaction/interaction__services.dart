import 'dart:convert';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_herd.dart';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_stock.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Interactionservices {
  RxString milk = "0".obs;
  RxString skins = "0".obs;
  RxList<ServiceHerd> herd = <ServiceHerd>[].obs;
  String basestockUri, baseherdUri;
  Interactionservices({required this.basestockUri, required this.baseherdUri});
  Future getstock({required days}) async {
    try {
      Uri uri = Uri.parse("$basestockUri$days");
      var response = await http.get(uri);

      var result = jsonDecode(response.body);
      milk.value = ServiceStok(amount: result).milk.toString();
      skins.value = ServiceStok(amount: result).skins.toString();
    } catch (e) {
      print(e);
    }
  }

  Future getherd({required days}) async {
    try {
      Uri uri = Uri.parse("$baseherdUri$days");
      print("======started======>");
      var response = await http.get(uri);
      var result = jsonDecode(response.body);
      herd.value = [];

      for (var yak in result['herd']) {
        herd.add(ServiceHerd.fromjson(yak));
      }
      print("<====ended========");
    } catch (e) {
      print("<======+++erorr+++======");
      print(e);
    }
  }
}
