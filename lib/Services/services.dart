import 'package:chuck_api/Model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Services {
  static Future<Model?> getRandom() async {
    try {
      var response = await Dio().get('https://api.chucknorris.io/jokes/random');

      if (response.statusCode == 200) {
        return Model(
          id: response.data['id'],
          categories: response.data['categories'],
          createdAt: response.data['created_at'],
          iconUrl: response.data['icon_url'],
          updatedAt: response.data['updated_at'],
          url: response.data['url'],
          value: response.data['value'],
        );
      }
    } on DioError catch (e) {
      // TODO
      debugPrint(e.response!.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Model?> getSpecific({required String category}) async {
    try {
      var response = await Dio()
          .get('https://api.chucknorris.io/jokes/random?category=$category');
      if (response.statusCode == 200) {
        return Model(
          id: response.data['id'],
          categories: response.data['categories'],
          createdAt: response.data['created_at'],
          iconUrl: response.data['icon_url'],
          updatedAt: response.data['updated_at'],
          url: response.data['url'],
          value: response.data['value'],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Model?> getCategories() async {
    try {
      var response =
          await Dio().get('https://api.chucknorris.io/jokes/categories');
      if (response.statusCode == 200) {
        return Model(categories: response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
