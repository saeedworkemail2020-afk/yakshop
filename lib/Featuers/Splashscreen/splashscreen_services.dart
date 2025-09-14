import 'package:http/http.dart' as http;

class SplashscreenServices {
  Uri uri;
  SplashscreenServices(this.uri);
  Future<bool> connectioncheck() async {
    try {
      var response = await http.get(uri);
      bool result;
      if (response.body == 'OK') {
        result = true;
      } else {
        result = false;
      }
      return result;
    } catch (e) {
      return false;
    }
  }
}
