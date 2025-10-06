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

  group("Interaction>services>call api:", () {
    group("Posts", () {
      group("order", () {
        test("successfully", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('okey', 206));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postorder(days: 6, milk: 5, skins: 9);
          expect(result.toString(), "sent successfully");
        });
        test("bad request", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('bad request', 400));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postorder(days: 6, milk: 5, skins: 9);
          expect(result.toString(), '400:bad request,check your data');
        });
        test("error", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('not found', 404));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postorder(days: 6, milk: 5, skins: 9);
          expect(result.toString(), 'error in sending');
        });
        test("catch", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenThrow(Exception('network error'));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postorder(days: 6, milk: 5, skins: 9);
          expect(result.toString(), 'error in sending please try agin later');
        });
      });
      group("load", () {
        test("successfully", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('okey', 205));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postload(
            name: 'ali',
            age: 11,
            gender: "f",
          );
          expect(result.toString(), "sent successfully");
        });
        test("bad request", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('bad request', 400));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postload(
            name: 'ali',
            age: 11,
            gender: "f",
          );
          expect(result.toString(), '400:bad request,check your data');
        });
        test("error", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenAnswer((_) async => http.Response('not found', 404));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postload(
            name: 'ali',
            age: 11,
            gender: "f",
          );
          expect(result.toString(), 'error in sending');
        });
        test("catch", () async {
          final client = MockClient();
          when(
            client.post(any, body: anyNamed('body')),
          ).thenThrow(Exception('network error'));
          var service = Interactionservices(
            baseherdUri: baseuri,
            baseloadUri: baseuri,
            basestockUri: baseuri,
            baseorderUri: baseuri,
            scaffoldkey: GlobalKey<ScaffoldState>(),
            client: client,
          );
          final result = await service.postload(
            name: 'ali',
            age: 11,
            gender: "f",
          );
          expect(result.toString(), 'error in sending please try agin later');
        });
      });
    });
    group('Gets', () {
      group(" Stock ", () {
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
      group(' herd ', () {
        test("successfully", () async {
          final client = MockClient();
          var data = {
            'herd': [
              {"name": 'a', "age": 2.1, 'age_last_shaved': 3.1},
              {"name": 'b', "age": 6.1, 'age_last_shaved': 5.1},
            ],
          };
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
          final result = await service.getherd(days: 6);
          expect(result, "Stocks received successfully");
          expect(service.herd[0].name, "a");
          expect(service.herd[0].age, 2.1);
          expect(service.herd[0].shaved, 3.1);
          expect(service.herd[1].name, "b");
          expect(service.herd[1].age, 6.1);
          expect(service.herd[1].shaved, 5.1);
        });
        test("not received successfully", () async {
          final client = MockClient();
          var data = {
            'herd': [
              {"name": 'a', "age": 2.1, 'age_last_shaved': 3.1},
              {"name": 'b', "age": 6.1, 'age_last_shaved': 5.1},
            ],
          };
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
          final result = await service.getherd(days: 6);
          expect(result, "Stocks not received successfully");
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
          final result = await service.getherd(days: 6);
          expect(result, 'Stocks not received successfully check your data');
        });
      });
    });
  });
}
