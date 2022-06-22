import '/../features/{{#snakeCase}}{{feature_name}}{{/snakeCase}}/domain/entities/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}_model.g.dart';

@JsonSerializable(createToJson: true)
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model {
  final int id;

  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model({
    required this.id,
  });

  factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model.fromJson(Map<String, dynamic> json) =>
      _${{#pascalCase}}{{feature_name}}{{/pascalCase}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{#pascalCase}}{{feature_name}}{{/pascalCase}}ModelToJson(this);

  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model copyWith({
    int? id
  }) {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model(
        id: id ?? this.id);
  }
}

extension Map{{#pascalCase}}{{feature_name}}{{/pascalCase}}ModelToDomain on {{#pascalCase}}{{feature_name}}{{/pascalCase}}Model {
  {{#pascalCase}}{{feature_name}}{{/pascalCase}} toDomain() => {{#pascalCase}}{{feature_name}}{{/pascalCase}}(
      id: id);
}
