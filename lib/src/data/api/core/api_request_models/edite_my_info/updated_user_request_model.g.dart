// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updated_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatedUserRequestModel _$UpdatedUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdatedUserRequestModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$UpdatedUserRequestModelToJson(
        UpdatedUserRequestModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
    };
