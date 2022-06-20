import 'dart:io';

import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase extends UseCase<String, SignUpUseCaseParams> {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);
  @override
  Future<Either<Failure, String>> call(SignUpUseCaseParams params) {
    return authRepository.signUp(
        name: params.name,
        cityId: params.cityId,
        address: params.address,
        area: params.area,
        latitude: params.latitude,
        longitude: params.longitude,
        email: params.email,
        phone: params.phone,
        firstName: params.firstName,
        lastName: params.lastName,
        postalCode: params.postalCode,
        prefix: params.prefix,
        position: params.position!,
        isBusiness: params.isBusiness,
        birthdate: params.birthdate,
        logo: params.logo);
  }
}

class SignUpUseCaseParams {
  final String name;
  final int cityId;
  final String address;
  final String area;
  final double latitude;
  final double longitude;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String postalCode;
  final String? prefix;
  final String? position;
  final bool isBusiness;
  final String? birthdate;
  final File? logo;

  SignUpUseCaseParams(
      {required this.name,
      required this.cityId,
      required this.address,
      required this.area,
      required this.latitude,
      required this.longitude,
      required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.postalCode,
      required this.prefix,
      this.position,
      required this.isBusiness,
      this.birthdate,
      required this.logo});
}
