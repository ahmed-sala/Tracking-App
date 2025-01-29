
import 'dart:io';

import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';

abstract interface class EditeMyInfoRepo{
  Future<ApiResult<UploadPhotoEntity>> uploadPhoto({required File image});
}