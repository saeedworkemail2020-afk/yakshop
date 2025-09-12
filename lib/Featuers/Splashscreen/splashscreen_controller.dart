import 'package:amozeshyar/Core/screen_size.dart';

class SplashscreenController {
  late ScreenSize _screenSize;

  SplashscreenController() {
    _screenSize = ScreenSize();
  }
  ScreenSize get screenSize => _screenSize;
}
