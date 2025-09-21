import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Core/service_config.dart';
import 'package:amozeshyar/Core/snackbarmodel.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_model.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_services.dart';
import 'package:flutter/material.dart';

class SplashscreenController {
  late ScreenSize _screenSize;
  late SplashscreenServices _services;
  late SplashscreenModel _model;
  late SnackbarModel _snackBar;
  SplashscreenController() {
    _screenSize = ScreenSize();
    _services = SplashscreenServices(ServiceConfig.urihealth);
    _model = SplashscreenModel();
    _snackBar = SnackbarModel();
  }
  ScreenSize get screenSize => _screenSize;
  SplashscreenServices get services => _services;
  SplashscreenModel get model => _model;
  SnackbarModel get snackBar => _snackBar;
}
