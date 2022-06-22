import '/../core/data/models/base_response/base_response.dart';
import '/../core/data/utils/configuration.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dartz/dartz.dart';
part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}_remote_datasource.g.dart';

abstract class {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSource {

  Future<BaseResponse<String>> {{#camelCase}}{{usecase_name}}{{/camelCase}}();

}

@LazySingleton(as: {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSource)
@RestApi(baseUrl: '')
abstract class {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSourceImpl implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSource {
  @factoryMethod
  factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _{{#pascalCase}}{{feature_name}}{{/pascalCase}}RemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/')
  Future<BaseResponse<String>> {{#camelCase}}{{usecase_name}}{{/camelCase}}();

}
