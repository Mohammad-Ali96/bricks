import '/../core/domain/entities/picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';

@JsonSerializable(createToJson: true)
class PictureModel {
  final String url;

  PictureModel(this.url);

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}

extension MapPictureModelToDomain on PictureModel {
  Picture toDomain() => Picture(url);
}
