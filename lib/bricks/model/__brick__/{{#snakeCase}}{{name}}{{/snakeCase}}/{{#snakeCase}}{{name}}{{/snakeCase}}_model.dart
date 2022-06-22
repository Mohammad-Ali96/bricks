import 'package:json_annotation/json_annotation.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_model.g.dart';

@JsonSerializable(createToJson: true)
class {{#pascalCase}}{{name}}{{/pascalCase}}Model {
final int id;

{{#pascalCase}}{{name}}{{/pascalCase}}Model({
required this.id,
});

factory {{#pascalCase}}{{name}}{{/pascalCase}}Model.fromJson(Map<String, dynamic> json) =>
_${{#pascalCase}}{{fname}}{{/pascalCase}}ModelFromJson(json);

Map<String, dynamic> toJson() => _${{#pascalCase}}{{name}}{{/pascalCase}}ModelToJson(this);

{{#pascalCase}}{{name}}{{/pascalCase}}Model copyWith({
int? id
}) {
return {{#pascalCase}}{{name}}{{/pascalCase}}Model(
id: id ?? this.id);
}
}

extension Map{{#pascalCase}}{{name}}{{/pascalCase}}ModelToDomain on {{#pascalCase}}{{name}}{{/pascalCase}}Model {
{{#pascalCase}}{{name}}{{/pascalCase}} toDomain() => {{#pascalCase}}{{name}}{{/pascalCase}}(
id: id);
}
