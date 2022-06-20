
import '/../core/domain/entities/phone.dart';
import '/../core/domain/entities/picture.dart';

class UserPersonalInfo {
  final int? id;
  final Phone? phone;
  final String? email;
  final String? firstName;
  final String? lastName;
  final DateTime? birthdate;
  final String? prefix;
  final String? position;
  final String? address;
  final Picture? profilePicture;

  UserPersonalInfo(
      this.id,
      this.phone,
      this.email,
      this.firstName,
      this.lastName,
      this.birthdate,
      this.prefix,
      this.position,
      this.address,
      this.profilePicture,);

  String get fullName => '$firstName $lastName';
}
