import 'dart:convert';
import 'package:http/http.dart' as http;
import 'covid_model.dart';

class CovidApi {
  Future<GlobalInfo> getGlobalInfo() async {
    var response = await http.get('https://coronavirus-19-api.herokuapp.com/all');
    print(response.body);
    var json = jsonDecode(response.body);
    var globalInfo = GlobalInfo.fromJson(json);
    return globalInfo;
  }
}