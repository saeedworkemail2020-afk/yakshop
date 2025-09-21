import 'package:amozeshyar/Core/service_config.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_model.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Splashscreen", () {
    test("service", () {
      final splashscreen = SplashscreenServices(ServiceConfig.urihealth);
      // expect(splashscreen.response.body, true);
    });
    test("model", () {
      final model = SplashscreenModel();
      model.navigate();
      expect(model.result, true);
    });
  });
}
