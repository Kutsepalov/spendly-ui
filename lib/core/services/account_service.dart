import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spendly/core/services/crud_service.dart';
import 'package:spendly/models/account.dart';

class AccountService extends CrudService<Account> {
  final Dio _dio = Dio();

  @override
  Future<List<Account>> getAll() async {
    const String token =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJta3V0c2UiLCJhdXRob3JpdGllcyI6W3sicm9sZSI6IlVTRVIifV0sImlhdCI6MTY4NzAwODQzMiwiZXhwIjo4ODA4NzAwODQzMn0.O9JLw7_jSTr_Y1w9TUud6AHvEX3DmgCBm_2t2I1S59qfXd6agDXtFu7NvCcALf8LA_fl5NkTue6R3cfIEYSp-w";
    const String url = "http://localhost:8080/api/v1/accounts";
    try {
      Response response = await _dio.get(
        url,
        options: defaultOptions(token),
      );
      final List json = response.data;
      List<Account> accounts = json.map((e) => Account.fromJson(e)).toList();
      return accounts;
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Account> getById() {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
