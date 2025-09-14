import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Core/service_config.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_model.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_services.dart';

class SplashscreenController {
  late ScreenSize _screenSize;
  late SplashscreenServices _services;
  late SplashscreenModel _model;
  SplashscreenController() {
    _screenSize = ScreenSize();
    _services = SplashscreenServices(ServiceConfig.urihealth);
    _model = SplashscreenModel();
  }
  ScreenSize get screenSize => _screenSize;
  SplashscreenServices get services => _services;
  SplashscreenModel get model => _model;
}
