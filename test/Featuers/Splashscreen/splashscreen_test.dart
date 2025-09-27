import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'splashscreen_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("splashscreen services:", () {
    test("connected", () async {
      final client = MockClient();
      when(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).thenAnswer((_) async => http.Response('OK', 200));
      // get answer
      final service = SplashscreenServices(
        Uri.parse('https://6fee9088a60f.ngrok-free.app'),
        client: client,
      );

      final result = await service.connectioncheck();

      //for values
      expect(result, true);
      //for messeage
      expect(service.message, contains('connected to server'));

      //اگر کد تغییر کنه و مثلاً دوبار درخواست بده، این تست بهت هشدار می‌ده که رفتارش عوض شده.
      verify(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).called(1);
    });
    test("not connecte", () async {
      final client = MockClient();
      when(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));
      // get answer
      final service = SplashscreenServices(
        Uri.parse('https://6fee9088a60f.ngrok-free.app'),
        client: client,
      );

      final result = await service.connectioncheck();

      //for values
      expect(result, false);
      //for messeage
      expect(service.message, contains('not connected to server'));

      //اگر کد تغییر کنه و مثلاً دوبار درخواست بده، این تست بهت هشدار می‌ده که رفتارش عوض شده.
      verify(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).called(1);
    });
    test("erorr in connection", () async {
      final client = MockClient();
      when(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).thenThrow(Exception('network error'));
      // get answer
      final service = SplashscreenServices(
        Uri.parse('https://6fee9088a60f.ngrok-free.app'),
        client: client,
      );

      final result = await service.connectioncheck();

      //for values
      expect(result, false);
      //for messeage
      expect(service.message, contains('erorr in connection'));

      //اگر کد تغییر کنه و مثلاً دوبار درخواست بده، این تست بهت هشدار می‌ده که رفتارش عوض شده.
      verify(
        client.get(Uri.parse('https://6fee9088a60f.ngrok-free.app')),
      ).called(1);
    });
  });
}
