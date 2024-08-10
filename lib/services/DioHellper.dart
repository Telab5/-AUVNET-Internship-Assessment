import 'package:auvnet_internship/consts/apiLink.dart';
import 'package:dio/dio.dart';

class Diohellper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData(path) {
    return dio!.get(path);
  }

  static Future<Response> PostData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.post(url, data: data);
  }

  // GEt Data category

  // static Future<Response> GetData(path) {
  //   return dio!.get(path);
  // }
}
