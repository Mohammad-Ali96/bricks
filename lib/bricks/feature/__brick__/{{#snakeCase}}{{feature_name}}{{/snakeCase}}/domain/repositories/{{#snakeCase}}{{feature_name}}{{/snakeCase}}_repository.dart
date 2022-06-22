import 'dart:async';
import '/../core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/domain/usecases/{{#snakeCase}}{{usecase_name}}{{/snakeCase}}_use_case.dart';

abstract class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository {

  Future<Either<Failure, String>> {{#camelCase}}{{usecase_name}}{{/camelCase}}({{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams params);

}
