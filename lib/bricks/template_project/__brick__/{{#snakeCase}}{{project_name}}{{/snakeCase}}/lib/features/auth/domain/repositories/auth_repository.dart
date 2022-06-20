import 'dart:async';
import 'dart:io';


import '/../core/domain/entities/failures.dart';
import '/../features/auth/domain/entities/user.dart';
import '/../features/auth/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getSignedInUser();

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, Unit>> resetPassword({required String email});

  Future<Either<Failure, String>> changePassword({
    required int userId,
    required String oldPassword,
    required String newPassword,
  });

  Future<Either<Failure, UserInfo>> updatePersonalInfo(
      int id,
      String email,
      String firstName,
      String lastName,
      String phone,
      String? prefix,
      String position,
      String? birthDate,
      String address,
      int cityId,
      String code,
      {File? logo});
  Future<Either<Failure, String>> signUp({
    required String name,
    required int cityId,
    required String address,
    required String area,
    required double latitude,
    required double longitude,
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String postalCode,
    String? prefix,
    required String position,
    required bool isBusiness,
    String? birthdate,
    required File? logo,
  });

  Future<Either<Failure, bool>> getIsFirstTimeLogged();

  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged);

  Future<Either<Failure, Stream<User?>>> subscribeToAuthStatus();
}
