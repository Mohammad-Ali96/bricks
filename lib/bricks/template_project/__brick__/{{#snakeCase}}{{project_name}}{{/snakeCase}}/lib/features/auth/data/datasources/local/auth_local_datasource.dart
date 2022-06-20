import 'dart:async';
import 'dart:convert';


import '/../core/data/utils/constants.dart';
import '/../features/auth/data/models/user/user_model.dart';
import '/../features/auth/data/models/user_info/user_info_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<void> signInUser(UserModel user);

  UserModel? getSignedInUser();

  void logout();

  void updatePersonalInfo(UserInfoModel userInfoModel);
  void setFirstTimeLogged(bool firstTimeLogged);

  bool getIsFirstTimeLogged();

  void setVirsionTimeStamp(int timeStamp);

  int? getVersionTimeStamp();

  StreamController<UserModel?> get authStatus;

  void dispose();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;
  final StreamController<UserModel?> _authStatusStream =
      StreamController<UserModel?>.broadcast();

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> signInUser(UserModel user) async {
    await sharedPreferences.setString(
      SharedPreferencesKeys.user,
      json.encode(user.toJson()),
    );
  }

  @override
  UserModel? getSignedInUser() {
    if (!sharedPreferences.containsKey(SharedPreferencesKeys.user)) return null;

    return UserModel.fromJson(
      json.decode(sharedPreferences.getString(SharedPreferencesKeys.user)!)
          as Map<String, dynamic>,
    );
  }

  @override
  void logout() {
    sharedPreferences.remove(SharedPreferencesKeys.user);
  }

  @override
  void updatePersonalInfo(UserInfoModel userInfoModel) async {
    final user = getSignedInUser();
    final updatedUser = UserModel(
      user!.token,
      user.refreshToken,
      userInfoModel.copyWith(),
    );
    await sharedPreferences.setString(
        SharedPreferencesKeys.user, json.encode(updatedUser.toJson()));
  }

  @override
  bool getIsFirstTimeLogged() {
    return sharedPreferences.getBool(SharedPreferencesKeys.isFirstTimeLogged) !=
        false;
  }

  @override
  void setFirstTimeLogged(bool firstTimeLogged) {
    sharedPreferences.setBool(
        SharedPreferencesKeys.isFirstTimeLogged, firstTimeLogged);
  }

  @override
  void setVirsionTimeStamp(int timeStamp) {
    sharedPreferences.setInt(SharedPreferencesKeys.timeStamp, timeStamp);
  }

  @override
  int? getVersionTimeStamp() {
    return sharedPreferences.getInt(SharedPreferencesKeys.timeStamp);
  }

  @override
  StreamController<UserModel?> get authStatus => _authStatusStream;

  @override
  @disposeMethod
  void dispose() {
    _authStatusStream.close();
  }
}
