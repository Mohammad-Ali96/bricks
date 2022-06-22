import '../../../domain/usecases/{{#snakeCase}}{{usecase_name}}{{/snakeCase}}_use_case.dart';
import '/../../../../core/domain/entities/failures.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_event.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_state.dart';

@injectable
class {{#pascalCase}}{{name}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{name}}{{/pascalCase}}Event, {{#pascalCase}}{{name}}{{/pascalCase}}State> {
  final {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCase {{#camelCase}}{{usecase_name}}{{/camelCase}}UseCase;

  {{#pascalCase}}{{name}}{{/pascalCase}}Bloc({
      required this.{{#camelCase}}{{usecase_name}}{{/camelCase}}UseCase,
    }) : super(Initial()) {
    on<{{#pascalCase}}{{name}}{{/pascalCase}}OnSubmit>(
      (event, emit) async {
        emit({{#pascalCase}}{{name}}{{/pascalCase}}Loading());
        final result = await {{#camelCase}}{{usecase_name}}{{/camelCase}}UseCase(event.params);
      result.fold((l) {
        emit({{#pascalCase}}{{name}}{{/pascalCase}}Failure(l));
        }, (r) {
    emit({{#pascalCase}}{{name}}{{/pascalCase}}Successful());
        });
    },
  );
  }
}
