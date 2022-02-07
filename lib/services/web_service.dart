import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:science_fair_project_app/constants.dart';

class WebService {

  Future searchServer(String kw) async{
    http.Response response = await http.get(Uri.parse("${kHost}/api/search?query=${kw}"));
    return {
      "status": response.statusCode,
      "body": jsonDecode(response.body)
    };
  }

}