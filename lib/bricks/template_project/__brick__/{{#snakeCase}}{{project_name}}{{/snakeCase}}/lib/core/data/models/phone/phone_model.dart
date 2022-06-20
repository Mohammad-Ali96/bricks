import '/../core/domain/entities/phone.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_model.g.dart';

@JsonSerializable(createToJson: true)
class PhoneModel {
  final String number;
  final String code;

  PhoneModel(this.number, this.code);

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}

extension MapPhoneModelToDomain on PhoneModel {
  Phone toDomain() => Phone(number, code);
}
