import 'package:dio/dio.dart';
import 'package:terminal_commands_flutter/model/category.dart';
import 'package:terminal_commands_flutter/model/command.dart';
import '../dio_client.dart';

class CategoryApiProvider {
  Dio _dio = DioClient.getDioClient();


  getCategories() async {
    try {
      var response = await _dio.get("categories");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((model) => Category.fromJson(model))
            .toList();
      } else
        print('erro');
    } catch (_) {}
  }



   getCommandsOfCategory(String categoryId) async {
    var response =
    await _dio.get("categories/" + categoryId + "/commands");
    return (response.data as List).map((x) => Command.fromJson(x)).toList();
  }
}
