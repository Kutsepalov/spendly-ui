import 'package:dio/dio.dart';

abstract class CrudService<T> {
  Future<List<T>> getAll();
  Future<T> getById();

  Options defaultOptions(String token) {
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
