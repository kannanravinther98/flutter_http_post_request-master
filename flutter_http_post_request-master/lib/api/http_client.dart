import 'package:flutter_http_post_request/config/app_settings.dart';
import 'package:flutter_http_post_request/utils/storage.dart';

class HttpClient {
  Map<String, String> createHeader() {
    var headers = {
      'content-type': 'application/json',

      // this is not necessary for login BUT
      // it's a shared class's function, and
      // will be reused by subsequent requests that required authorization
      'Authorization':
          'Bearer ${Storage().token}', // using bearer token as authorization
    };

    return headers;
  }

  Uri createUri(String route, [Map<String, dynamic> param = const {}]) {
    // the follwings WILL change when we switched to using real name instead of IP
    return Uri(
      scheme: 'http', // switch to https once we are on secured environment
      host: AppSettings.apiHost,
      path: route,
      port: AppSettings
          .apiPort, // can be commented out once we are on secured environment
      queryParameters: param,
    );
  }
}
