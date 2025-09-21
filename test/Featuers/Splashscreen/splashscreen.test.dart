import 'package:amozeshyar/Core/service_config.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Splashscreen", () {
    test("service", () async {
      final splashscreen = SplashscreenServices(ServiceConfig.urihealth);
      expect(await splashscreen.connectioncheck(), true);
    });
  });
}
