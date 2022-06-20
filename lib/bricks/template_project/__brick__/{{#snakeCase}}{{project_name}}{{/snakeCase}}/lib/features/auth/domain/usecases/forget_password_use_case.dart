import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordUseCase extends UseCase<Unit, ForgetPasswordUseCaseParams> {
  final AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);
  @override
  Future<Either<Failure, Unit>> call(ForgetPasswordUseCaseParams params) {
    return authRepository.resetPassword(email: params.email);
  }
}

class ForgetPasswordUseCaseParams {
  final String email;

  ForgetPasswordUseCaseParams(this.email);
}
