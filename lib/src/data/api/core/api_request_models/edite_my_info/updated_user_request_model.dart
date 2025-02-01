import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/edite_my_info/updated_user_info_request_entity.dart';

part 'updated_user_request_model.g.dart';

@JsonSerializable()
class UpdatedUserRequestModel {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;

  UpdatedUserRequestModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.gender,
  });

  factory UpdatedUserRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UpdatedUserRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatedUserRequestModelToJson(this);
  }

  factory UpdatedUserRequestModel.fromEntity(
      UpdatedUserInfoRequestEntity entity) {
    return UpdatedUserRequestModel(
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        phone: entity.phone);
  }
}
