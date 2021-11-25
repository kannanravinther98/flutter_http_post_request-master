import 'package:flutter_http_post_request/api/http_client.dart';
import 'package:flutter_http_post_request/config/server_addresses.dart';
import 'package:flutter_http_post_request/utils/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // String url = "http://18.140.61.61:9091/markdown-api/login";

    // hang on sure tq
    var headers = HttpClient().createHeader();
    var route = HttpClient().createUri(ServerAddresses.login);

    // i suspect this was the issue, map needs to be "encoded" to appliction/json
    // toJson returns a map which will default to application/x-www-form-urlencoded
    // our apis expect application/json
    var encodedJson =
        json.encode(requestModel.toJson()); // <== problem was here

    // sorry had to do things right as those additional files/steps were necessary

    // you can remove my comments after you have reviewed them sure tqvm really helpful

    final response =
        await http.post(route, headers: headers, body: encodedJson);
    if (response.statusCode == 200 || response.statusCode == 400) {
      // if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception ('Failed to load data!');
    }
  }
}

   
