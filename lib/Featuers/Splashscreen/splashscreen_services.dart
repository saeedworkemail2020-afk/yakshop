import 'package:http/http.dart' as http;

class SplashscreenServices {
  Uri uri;
  String message = '';
  late final http.Client client;
  SplashscreenServices(this.uri, {http.Client? client})
    : client = client ?? http.Client();
  //for unit test
  // ignore: prefer_typing_uninitialized_variables
  // var response;
  Future<bool> connectioncheck() async {
    message = '';
    try {
      var response = await client.get(uri);
      bool result;

      if (response.body == 'OK') {
        result = true;
        message = "${response.body}:connected to server";
      } else {
        message = "${response.statusCode}:not connected to server";

        result = false;
      }
      return result;
    } catch (e) {
      message = "${e.hashCode}:erorr in connection ";
      return false;
    }
  }
}
