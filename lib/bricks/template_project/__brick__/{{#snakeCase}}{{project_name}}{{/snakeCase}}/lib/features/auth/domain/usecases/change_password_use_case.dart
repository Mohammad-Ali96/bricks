import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUseCase
    extends UseCase<String, ChangePasswordUseCaseParams> {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ChangePasswordUseCaseParams params) {
    return repository.changePassword(
      userId: params.userId,
      newPassword: params.newPassword,
      oldPassword: params.oldPassword,
    );
  }
}

class ChangePasswordUseCaseParams {
  final int userId;
  final String oldPassword;
  final String newPassword;

  ChangePasswordUseCaseParams({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });
}
