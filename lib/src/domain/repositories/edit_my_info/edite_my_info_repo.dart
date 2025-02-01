import 'dart:io';

import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/updated_user_info_request_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';

abstract interface class EditeMyInfoRepo {
  Future<ApiResult<UploadPhotoEntity>> uploadPhoto({required File image});
  Future<ApiResult<AppUserEntity>> updateUserInfo(
      {required UpdatedUserInfoRequestEntity updatedUserInfoRequestEntity});
}
