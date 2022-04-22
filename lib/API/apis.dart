import 'dart:convert';
import 'package:http/http.dart';
import 'package:netflix_ui/API/api_model.dart';

class HttpServices {
  Future<List<dynamic>> getTrending(String listType) async {
    Response response = await get(Uri.parse(listType));
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> list = decodedJson['results']
          .map((item) => Trending.fromJson(item))
          .toList();

      return list;
    } else {
      throw 'Couldn\t get list';
    }
  }

  Future<List<dynamic>> getUpcoming(String listType) async {
    Response res = await get(Uri.parse(listType));
    if (res.statusCode == 200) {
      final decodedJson = jsonDecode(res.body);
      // print(decodedJson);
      List<dynamic> list = decodedJson['results']
          .map((item) => Upcoming.fromJson(item))
          .toList();
      return list;
    } else {
      throw 'Couldn\t get list';
    }
  }
}
