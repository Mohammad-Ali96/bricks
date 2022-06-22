part of '{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.dart';


abstract
class {{#pascalCase}}{{name}}{{/pascalCase}}State {}

class Initial extends {{#pascalCase}}{{name}}{{/pascalCase}}State {}

class {{#pascalCase}}{{name}}{{/pascalCase}}Successful extends {{#pascalCase}}{{name}}{{/pascalCase}}State {

{{#pascalCase}}{{name}}{{/pascalCase}}Successful();
}

class {{#pascalCase}}{{name}}{{/pascalCase}}Loading extends {{#pascalCase}}{{name}}{{/pascalCase}}State {}

class {{#pascalCase}}{{name}}{{/pascalCase}}Failure extends {{#pascalCase}}{{name}}{{/pascalCase}}State {
final Failure failure;

{{#pascalCase}}{{name}}{{/pascalCase}}Failure(this.failure);
}