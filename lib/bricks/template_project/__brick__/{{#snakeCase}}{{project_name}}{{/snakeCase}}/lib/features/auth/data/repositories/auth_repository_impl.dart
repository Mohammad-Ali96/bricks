import 'dart:async';
import 'dart:io';


import '/../core/data/repositories/base_repository_impl.dart';
import '/../core/data/utils/configuration.dart';
import '/../core/domain/entities/failures.dart';
import '/../core/domain/utils/network/network_info.dart';
import '/../features/auth/data/datasources/local/auth_local_datasource.dart';
import '/../features/auth/data/datasources/remote/auth_remote_datasource.dart';
import '/../features/auth/data/models/user/user_model.dart';
import '/../features/auth/data/models/user_info/user_info_model.dart';
import '/../features/auth/domain/entities/user.dart';
import '/../features/auth/domain/entities/user_info.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource local;
  final AuthRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

  AuthRepositoryImpl(this.local, this.remote, this.networkInfo, this.logger,
      this.configuration)
      : super(networkInfo, logger);

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    return right(local.getSignedInUser()?.toDomain());
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return request(
      () async {
        var userResponse =
            await remote.login(email, password,);
        local.signInUser(userResponse.data!);
        local.authStatus.add(userResponse.data);
        return right(userResponse.data!.toDomain());
      },
      checkToken: false,
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    local.logout();
    local.authStatus.add(null);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    return request(() async {
      await remote.resetPassword(email,);
      return right(unit);
    });
  }

  @override
  Future<Either<Failure, String>> changePassword({
    required int userId,
    required String newPassword,
    required String oldPassword,
  }) {
    return request(
      () async {
        final result = await remote.changePassword(
          userId,
          oldPassword,
          newPassword,
        );
        local.authStatus.add(null);
        return right(result);
      },
    );
  }

  @override
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
      {File? logo}) {
    return request(() async {
      var fullPhone = '$code$phone';
      if (!fullPhone.startsWith('+')) {
        fullPhone = '+$fullPhone';
      }

      final result = await remote.editPersonalInfo(
        id,
        email,
        firstName,
        lastName,
        fullPhone,
        prefix,
        position,
        birthDate,
        address,
        cityId,
        avatar: logo,
      );
      final signedInUser = authLocal.getSignedInUser();

      if (result.data!.id == signedInUser!.userInfo.id) {
        local.updatePersonalInfo(result.data!);
        local.authStatus.add(authLocal.getSignedInUser());
      }
      return right(result.data!.toDomain());
    });
  }

  @override
  Future<Either<Failure, String>> signUp(
      {required String name,
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
      required File? logo}) async {
    return request(() async {
      final userResponse = await remote.signUp(
        name,
        cityId,
        address,
        area,
        latitude,
        longitude,
        email,
        phone,
        firstName,
        lastName,
        postalCode,
        prefix,
        position,
        isBusiness,
        birthdate,
        logo: logo,
      );

      return right(userResponse);
    });
  }

  @override
  Future<Either<Failure, bool>> getIsFirstTimeLogged() async {
    return right(local.getIsFirstTimeLogged());
  }

  @override
  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged) async {
    return right(local.setFirstTimeLogged(firstTimeLogged));
  }

  @override
  Future<Either<Failure, Stream<User?>>> subscribeToAuthStatus() async {
    return right(local.authStatus.stream.map((event) => event?.toDomain()));
  }
}
