import 'package:http/http.dart' as http;

class SplashscreenServices {
  Future<bool> connectioncheck() async {
    try {
      Uri uri = Uri.parse('https://e8f417133b1b.ngrok-free.app/health');
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
