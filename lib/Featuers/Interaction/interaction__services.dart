import 'dart:convert';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_herd.dart';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_stock.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Interactionservices {
  RxString milk = "0".obs;
  RxString skins = "0".obs;
  RxList<DataModeleHerd> herd = <DataModeleHerd>[].obs;
  late GlobalKey<ScaffoldState> scaffoldkey;

  String basestockUri, baseherdUri, baseorderUri, baseloadUri;
  Interactionservices({
    required this.basestockUri,
    required this.baseherdUri,
    required this.baseorderUri,
    required this.baseloadUri,
    required this.scaffoldkey,
  });
  Future getstock({required days}) async {
    try {
      Uri uri = Uri.parse("$basestockUri$days");
      var response = await http.get(uri);

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        milk.value = DataModelStok(amount: result).milk.toString();
        skins.value = DataModelStok(amount: result).skins.toString();
        controller.snackBar.showSnackBar(
          'Stocks received successfully',
          scaffoldkey.currentState!.context,
          Colors.green,
        );
      } else {
        controller.snackBar.showSnackBar(
          'Stocks not received successfully',
          scaffoldkey.currentState!.context,
          Colors.orange,
        );
      }
    } catch (e) {
      controller.snackBar.showSnackBar(
        'Stocks not received successfully check your data',
        scaffoldkey.currentState!.context,
        Colors.red,
      );
    }
  }

  Future getherd({required days}) async {
    try {
      Uri uri = Uri.parse("$baseherdUri$days");

      var response = await http.get(uri);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        controller.snackBar.showSnackBar(
          'Herd received successfully',
          scaffoldkey.currentState!.context,
          Colors.green,
        );
      } else {
        controller.snackBar.showSnackBar(
          'Herd not received successfully',
          scaffoldkey.currentState!.context,
          Colors.orange,
        );
        herd.value = [];
        for (var yak in result['herd']) {
          herd.add(DataModeleHerd.fromjson(yak));
        }
      }
    } catch (e) {
      controller.snackBar.showSnackBar(
        'Herd not received successfully check your data',
        scaffoldkey.currentState!.context,
        Colors.red,
      );
    }
  }

  Future postorder({
    required days,
    required double milk,
    required int skins,
  }) async {
    try {
      var params = {
        "customer": "string",
        "order": {"milk": milk, "skins": skins},
      };
      Uri uri = Uri.parse("$baseorderUri$days");

      var response = await http.post(uri, body: jsonEncode(params));
      if (response.statusCode == 206) {
        controller.snackBar.showSnackBar(
          'order sent successfully',
          scaffoldkey.currentState!.context,
          Colors.green,
        );
      } else if (response.statusCode == 400) {
        controller.snackBar.showSnackBar(
          '400:bad request,chech your data',
          scaffoldkey.currentState!.context,
          Colors.yellow,
        );
      } else {
        controller.snackBar.showSnackBar(
          'error in sending order',
          scaffoldkey.currentState!.context,
          Colors.orange,
        );
      }
    } catch (e) {
      controller.snackBar.showSnackBar(
        'error in sending order',
        scaffoldkey.currentState!.context,
        Colors.red,
      );
    }
  }

  Future postload({
    required String name,
    required int age,
    required String gender,
  }) async {
    try {
      final params = '''
<herd>
    <labyak name="$name" age="$age" sex="$gender"/>
</herd>
  ''';
      // print(params);

      Uri uri = Uri.parse(baseloadUri);

      var response = await http.post(uri, body: params);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 205) {
        controller.snackBar.showSnackBar(
          'order sent successfully',
          scaffoldkey.currentState!.context,
          Colors.green,
        );
      } else if (response.statusCode == 400) {
        controller.snackBar.showSnackBar(
          '400:bad request,chech your data',
          scaffoldkey.currentState!.context,
          Colors.yellow,
        );
      } else {
        controller.snackBar.showSnackBar(
          'error in sending order',
          scaffoldkey.currentState!.context,
          Colors.orange,
        );
      }
    } catch (e) {
      controller.snackBar.showSnackBar(
        'error in sending order',
        scaffoldkey.currentState!.context,
        Colors.red,
      );
      print(e);
    }
  }
}
