import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_response_model.g.dart';

@JsonSerializable()
class UploadPhotoResponseModel {
  @JsonKey(name: "message")
  final String? message;

  UploadPhotoResponseModel ({
    this.message,
  });

  factory UploadPhotoResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UploadPhotoResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadPhotoResponseModelToJson(this);
  }
}


