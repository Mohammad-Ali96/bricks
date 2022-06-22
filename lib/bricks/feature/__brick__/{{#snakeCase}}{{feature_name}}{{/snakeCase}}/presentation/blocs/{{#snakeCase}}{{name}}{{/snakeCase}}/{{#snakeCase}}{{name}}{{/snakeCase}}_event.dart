part of '{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.dart';

abstract
class {{#pascalCase}}{{name}}{{/pascalCase}}Event {}

class {{#pascalCase}}{{name}}{{/pascalCase}}OnSubmit extends {{#pascalCase}}{{name}}{{/pascalCase}}Event {
final {{#pascalCase}}{{usecase_name}}{{/pascalCase}}UseCaseParams params;

{{#pascalCase}}{{name}}{{/pascalCase}}OnSubmit(this.params);
}