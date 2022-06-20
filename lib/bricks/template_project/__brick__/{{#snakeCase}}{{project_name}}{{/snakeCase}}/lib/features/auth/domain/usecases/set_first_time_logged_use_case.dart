import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetFirstTimeLoggedUseCase
    extends UseCase<void, SetFirstTimeLoggedUseCaseParams> {
  final AuthRepository authRepository;

  SetFirstTimeLoggedUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return authRepository.setFirstTimeLogged(params.isFirstTimeLogged);
  }
}

class SetFirstTimeLoggedUseCaseParams {
  final bool isFirstTimeLogged;

  SetFirstTimeLoggedUseCaseParams({required this.isFirstTimeLogged});
}
