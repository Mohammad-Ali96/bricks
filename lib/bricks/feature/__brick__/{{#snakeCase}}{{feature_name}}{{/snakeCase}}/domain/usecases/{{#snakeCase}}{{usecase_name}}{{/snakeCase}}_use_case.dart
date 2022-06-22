import '/../core/domain/entities/failures.dart';
import '/../core/domain/usecases/usecase.dart';
import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/domain/repositories/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCase extends UseCase<String, {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams> {
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository {{#camelCase}}{{feature_name}}{{/camelCase}}Repository;

  {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCase(this.{{#camelCase}}{{feature_name}}{{/camelCase}}Repository);

  @override
  Future<Either<Failure, String>> call({{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams params) {
    return {{#camelCase}}{{feature_name}}{{/camelCase}}Repository.{{#camelCase}}{{usecase_name}}{{/camelCase}}(params);
  }
}

class {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams {


  {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams();
}
