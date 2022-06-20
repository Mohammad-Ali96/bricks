import 'dart:io';


import '/../core/data/models/base_response/base_response.dart';
import '/../core/data/utils/configuration.dart';
import '/../features/auth/data/models/refresh_token_response/refresh_token_response_model.dart';
import '/../features/auth/data/models/user/user_model.dart';
import '/../features/auth/data/models/user_info/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<UserModel>> login(
      String email, String password);

  Future<BaseResponse<RefreshTokenResponseModel>> refreshToken(
      String refreshToken);

  Future<String> resetPassword(String email,);

  Future<String> changePassword(
    int userId,
    String oldPassword,
    String newPassword,
  );

  Future<BaseResponse<UserInfoModel>> editPersonalInfo(
      int userId,
      String email,
      String firstName,
      String lastName,
      String phone,
      String? prefix,
      String position,
      String? birthdate,
      String address,
      int cityId,
      {File? avatar});
  Future<String> signUp(
      String name,
      int cityId,
      String address,
      String area,
      double latitude,
      double longitude,
      String email,
      String phone,
      String firstName,
      String lastName,
      String postalCode,
      String? prefix,
      String position,
      bool isBusiness,
      String? birthdate,
      {File? logo});
}

@LazySingleton(as: AuthRemoteDataSource)
@RestApi(baseUrl: '')
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _AuthRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/auth/login?shortTerm=0')
  Future<BaseResponse<UserModel>> login(@Field() String email,
      @Field() String password,);

  @override
  @POST('/auth/token')
  Future<BaseResponse<RefreshTokenResponseModel>> refreshToken(
      @Field() String refreshToken);

  @override
  @POST('/auth/reset-password')
  Future<String> resetPassword(
      @Field() String email,);

  @override
  @PATCH('/user/{userId}/change-password')
  Future<String> changePassword(
    @Path() int userId,
    @Field() String oldPassword,
    @Field() String newPassword,
  );

  @override
  @PATCH('/user/{userId}/update')
  Future<BaseResponse<UserInfoModel>> editPersonalInfo(
    @Path() int userId,
    @Part() String email,
    @Part() String firstName,
    @Part() String lastName,
    @Part() String phone,
    @Part() String? prefix,
    @Part() String position,
    @Part() String? birthdate,
    @Part() String address,
    @Part() int cityId, {
    @Part(contentType: 'image/jpeg') File? avatar,
  });

  @override
  @POST('/company/customer/signup')
  Future<String> signUp(
    @Part() String name,
    @Part() int cityId,
    @Part() String address,
    @Part() String area,
    @Part() double latitude,
    @Part() double longitude,
    @Part() String email,
    @Part() String phone,
    @Part() String firstName,
    @Part() String lastName,
    @Part() String postalCode,
    @Part() String? prefix,
    @Part() String position,
    @Part() bool isBusiness,
    @Part() String? birthdate,{
    @Part(contentType: 'image/jpeg') File? logo,
  });

}
