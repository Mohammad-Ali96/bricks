
import '/../core/data/models/phone/phone_model.dart';
import '/../core/data/models/picture/picture_model.dart';
import '/../features/auth/domain/entities/user_personal_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_personal_info_model.g.dart';

@JsonSerializable(createToJson: true)
class UserPersonalInfoModel {
  int? id;
  final PhoneModel? phone;
  final String? email;
  final String? firstName;
  final String? lastName;
  final DateTime? birthdate;
  final String? prefix;
  final String? position;
  final int? cityId;
  final String? address;
  final PictureModel? profilePicture;

  UserPersonalInfoModel(
    this.id,
    this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.prefix,
    this.position,
    this.cityId,
    this.address,
    this.profilePicture,
  );

  factory UserPersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserPersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPersonalInfoModelToJson(this);
}

extension MapUserPersonalInfoModelToDomain on UserPersonalInfoModel {
  UserPersonalInfo toDomain() => UserPersonalInfo(
      id,
      phone?.toDomain(),
      email,
      firstName,
      lastName,
      birthdate,
      prefix,
      position,
      address,
      profilePicture?.toDomain(),
     );
}
