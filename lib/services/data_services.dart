import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/models/data_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com';
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '$baseUrl/api/getplaces';
    http.Response res = await http.get(Uri.parse(apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e.toString());
      return <DataModel>[];
    }
  }
}
