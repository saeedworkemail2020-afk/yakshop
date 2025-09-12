class ScreenSize {
  static final ScreenSize _singleton = ScreenSize._internal();
  factory ScreenSize() => _singleton;
  ScreenSize._internal();
  late double width;
  late double height;
  late double splashscreen;
  late double fontSize;
  late double buttonfontsize;
  late double fieldtextsize;
  late double textfontsize;

  void getScreenSize(double width, double height) {
    this.width = width;
    this.height = height;
    splashscreen = width * 0.8;
    fontSize = (width + height) / 100;
    buttonfontsize = fontSize * 1.4;
    fieldtextsize = fontSize * 1.35;
    textfontsize = fontSize * 1.2;
  }
}
