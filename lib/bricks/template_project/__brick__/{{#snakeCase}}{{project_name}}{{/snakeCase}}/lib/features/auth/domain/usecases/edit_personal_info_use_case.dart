import 'dart:io';

import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/auth/domain/entities/user_info.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPersonalInfoUseCase
    extends UseCase<UserInfo, EditPersonalInfoUseCaseParams> {
  final AuthRepository authRepository;

  EditPersonalInfoUseCase(this.authRepository);
  @override
  Future<Either<Failure, UserInfo>> call(params) async {
    return await authRepository.updatePersonalInfo(
      params.id,
      params.email,
      params.firstName,
      params.lastName,
      params.phone,
      params.prefix,
      params.position,
      params.birthDate,
      params.address,
      params.cityId,
      params.code,
      logo: params.image,
    );
  }
}

class EditPersonalInfoUseCaseParams {
  final int id;
  final String position;
  final String firstName;
  final String lastName;
  final String? birthDate;
  final int cityId;
  final String address;
  final String email;
  final String code;
  final String phone;
  final String? prefix;
  final File? image;

  EditPersonalInfoUseCaseParams({
    required this.id,
    required this.position,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.cityId,
    required this.address,
    required this.email,
    required this.code,
    required this.phone,
    required this.prefix,
    this.image,
  });
}
