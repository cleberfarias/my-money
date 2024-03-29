import 'dart:convert';
import 'package:my_money/src/shared/model/use_model.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_sorage.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    Map<String, dynamic> userJson = {};

    String? user = await AppSecureStorage.readItem(Appkeys.user);

    if (user != null) userJson.addAll(jsonDecode(user));

    String goalValue =
        await AppSecureStorage.readItem(Appkeys.goal_value) ?? "0";

    userJson["limitValue"] = goalValue;

    UserModel userData = UserModel.fromJson(userJson);

    return userData;
  }
}
