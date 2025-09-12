class ScreenSize {
  static final ScreenSize _singleton = ScreenSize._internal();
  factory ScreenSize() => _singleton;
  ScreenSize._internal();
  late double width;
  late double height;
  late double splashscreen;

  void getScreenSize(double width, double height) {
    this.width = width;
    this.height = height;
    splashscreen = width * 0.8;
  }
}
