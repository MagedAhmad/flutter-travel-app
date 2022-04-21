import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/data_model.dart';

class DataServices {
  String BaseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    http.Response res = await http.get(Uri.parse(BaseUrl + apiUrl));

    try {
      if(res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else {
        return <DataModel>[];
      }
    }catch(e) {
      print(e);
      return <DataModel>[];
    }
  }
}