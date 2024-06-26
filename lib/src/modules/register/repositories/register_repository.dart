import 'package:dio/dio.dart';
import 'package:my_money/src/http/app_dio.dart';
import 'package:my_money/src/modules/register/model/register_data_modal.dart';

class RegisterRepository {
  String baseURL = "http://10.0.0.102:3099/user";

  Future<Response<Map<String, dynamic>>> sendRegisterData(
      RegisterDataModel registerData) async {
    final Dio clientHTTP = await AppDio.getConnection();

    return clientHTTP.post('$baseURL/create', data: registerData.toJson());
  }
}
