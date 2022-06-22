import 'dart:async';
import 'dart:io';


import '/../core/data/repositories/base_repository_impl.dart';
import '/../core/data/utils/configuration.dart';
import '/../core/domain/entities/failures.dart';
import '/../core/domain/utils/network/network_info.dart';
import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/data/datasources/remote/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_remote_datasource.dart';
import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/domain/repositories/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_repository.dart';
import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/domain/usecases/{{#snakeCase}}{{usecase_name}}{{/snakeCase}}_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository)
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}RepositoryImpl extends BaseRepositoryImpl implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository {
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

{{#pascalCase}}{{feature_name}}{{/pascalCase}}RepositoryImpl(this.remote, this.networkInfo, this.logger,
      this.configuration)
      : super(networkInfo, logger);


  @override
  Future<Either<Failure, String>> {{#camelCase}}{{usecase_name}}{{/camelCase}}({{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams params) async {
    return request(
      () async {
        var response = await remote.{{#camelCase}}{{usecase_name}}{{/camelCase}}();
        return right(response.data!);
        },
      );
  }

}
