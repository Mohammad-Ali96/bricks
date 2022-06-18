import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_event.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}_state.dart';

@injectable
class {{#pascalCase}}{{name}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{name}}{{/pascalCase}}Event, {{#pascalCase}}{{name}}{{/pascalCase}}State> {
  final {{#pascalCase}}{{name}}{{/pascalCase}}UseCase {{#camelCase}}{{name}}{{/camelCase}}UseCase;

  {{#pascalCase}}{{name}}{{/pascalCase}}Bloc({
    required this.{{#pascalCase}}{{name}}{{/pascalCase}}UseCase,
  }) : super(Initial()) {
    on<{{#pascalCase}}{{name}}{{/pascalCase}}OnSubmit>(
          (event, emit) async {
        emit({{#pascalCase}}{{name}}{{/pascalCase}}Loading());
        final result = await {{#camelCase}}{{name}}{{/camelCase}}UseCase(event.params);
        result.fold((l) {
          emit({{#pascalCase}}{{name}}{{/pascalCase}}Failure(l));
        }, (r) {
          emit({{#pascalCase}}{{name}}{{/pascalCase}}Successful());
        });
      },
    );
  }
}
