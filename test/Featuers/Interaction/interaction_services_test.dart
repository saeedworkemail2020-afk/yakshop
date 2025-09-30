import 'dart:convert';

import 'package:amozeshyar/Featuers/Interaction/interaction__services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'interaction_services_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final baseuri = 'https://6fee9088a60f.ngrok-free.app/yak-shop/stock/';

  group("Interaction>services>Get>", () {
    group("Stock", () {
      test("successfully", () async {
        final client = MockClient();
        var data = {"milk": 5, "skins": 6};
        when(
          client.get(any),
        ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));
        var service = Interactionservices(
          baseherdUri: baseuri,
          baseloadUri: baseuri,
          basestockUri: baseuri,
          baseorderUri: baseuri,
          scaffoldkey: GlobalKey<ScaffoldState>(),
          client: client,
        );
        final result = await service.getstock(days: 6);
        expect(result, "Stocks received successfully");
        expect(service.milk.value, "5");
        expect(service.skins.value, "6");
      });
      test("not received successfully", () async {
        final client = MockClient();
        var data = {"milk": 5, "skins": 6};
        when(
          client.get(any),
        ).thenAnswer((_) async => http.Response(jsonEncode(data), 404));
        var service = Interactionservices(
          baseherdUri: baseuri,
          baseloadUri: baseuri,
          basestockUri: baseuri,
          baseorderUri: baseuri,
          scaffoldkey: GlobalKey<ScaffoldState>(),
          client: client,
        );
        final result = await service.getstock(days: 6);
        expect(result, 'Stocks not received successfully');
      });
      test("Erorr", () async {
        final client = MockClient();
        when(client.get(any)).thenThrow(Exception('network error'));
        var service = Interactionservices(
          baseherdUri: baseuri,
          baseloadUri: baseuri,
          basestockUri: baseuri,
          baseorderUri: baseuri,
          scaffoldkey: GlobalKey<ScaffoldState>(),
          client: client,
        );
        final result = await service.getstock(days: 6);
        expect(result, 'Stocks not received successfully check your data');
      });
    });
  });
}
