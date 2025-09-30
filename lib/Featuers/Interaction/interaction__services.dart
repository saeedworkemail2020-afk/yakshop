import 'dart:convert';
import 'package:amozeshyar/Core/snackbarmodel.dart';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_herd.dart';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Interactionservices {
  RxString milk = "0".obs;
  RxString skins = "0".obs;
  RxList<DataModeleHerd> herd = <DataModeleHerd>[].obs;
  String message = 'null';
  late GlobalKey<ScaffoldState> scaffoldkey;
  late final http.Client client;
  String basestockUri, baseherdUri, baseorderUri, baseloadUri;

  Interactionservices({
    required this.basestockUri,
    required this.baseherdUri,
    required this.baseorderUri,
    required this.baseloadUri,
    required this.scaffoldkey,
    http.Client? client,
  }) : client = client ?? http.Client();
  Future getdata({required days, required what}) async {
    message = 'null';
    if (what == 'stock') {
      message = await getstock(days: days);
    } else if (what == 'herd') {
      message = await getherd(days: days);
    }
    if (message == 'Stocks received successfully') {
      SnackbarModel().showSnackBar(
        'Stocks received successfully',
        Colors.green,
        scaffoldkey.currentState!.context,
      );
    } else if (message == "Stocks not received successfully") {
      SnackbarModel().showSnackBar(
        'Stocks not received successfully',
        Colors.orange,
        scaffoldkey.currentState!.context,
      );
    } else {
      SnackbarModel().showSnackBar(
        'Stocks not received successfully check your data',
        Colors.red,
        scaffoldkey.currentState!.context,
      );
    }
    message = 'null';
  }

  // SnackbarModel
  Future<String> getstock({required days}) async {
    try {
      Uri uri = Uri.parse("$basestockUri$days");
      var response = await client.get(uri);

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        milk.value = DataModelStok(amount: result).milk.toString();
        skins.value = DataModelStok(amount: result).skins.toString();
        return 'Stocks received successfully';
      } else {
        return 'Stocks not received successfully';
      }
    } catch (e) {
      return 'Stocks not received successfully check your data';
    }
  }

  Future getherd({required days}) async {
    try {
      Uri uri = Uri.parse("$baseherdUri$days");

      var response = await client.get(uri);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        herd.value = [];
        for (var yak in result['herd']) {
          herd.add(DataModeleHerd.fromjson(yak));
        }
        return 'Stocks received successfully';
      } else {
        return 'Stocks not received successfully';
      }
    } catch (e) {
      return 'Stocks not received successfully check your data';
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
        SnackbarModel().showSnackBar(
          'order sent successfully',
          Colors.green,
          scaffoldkey.currentState!.context,
        );
      } else if (response.statusCode == 400) {
        SnackbarModel().showSnackBar(
          '400:bad request,chech your data',
          Colors.yellow,
          scaffoldkey.currentState!.context,
        );
      } else {
        SnackbarModel().showSnackBar(
          'error in sending order',
          Colors.orange,
          scaffoldkey.currentState!.context,
        );
      }
    } catch (e) {
      SnackbarModel().showSnackBar(
        'error in sending order',
        Colors.red,
        scaffoldkey.currentState!.context,
      );
    }
  }

  Future postload({
    required String name,
    required int age,
    required String gender,
  }) async {
    try {
      final params =
          "<herd><labyak name='$name' age='$age' sex='$gender'/></herd>";
      Uri uri = Uri.parse(baseloadUri);

      var response = await http.post(uri, body: params);
      if (response.statusCode == 205) {
        SnackbarModel().showSnackBar(
          'order sent successfully',
          Colors.green,
          scaffoldkey.currentState!.context,
        );
      } else if (response.statusCode == 400) {
        SnackbarModel().showSnackBar(
          '400:bad request,chech your data',
          Colors.yellow,
          scaffoldkey.currentState!.context,
        );
      } else {
        SnackbarModel().showSnackBar(
          'error in sending order',
          Colors.orange,
          scaffoldkey.currentState!.context,
        );
      }
    } catch (e) {
      SnackbarModel().showSnackBar(
        'error in sending order',
        Colors.red,
        scaffoldkey.currentState!.context,
      );
    }
  }
}
