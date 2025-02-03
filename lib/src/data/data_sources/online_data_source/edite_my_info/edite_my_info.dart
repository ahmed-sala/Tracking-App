
import 'dart:io';

import 'package:tracking_app/src/data/api/core/api_response_models/edite_my_info/updated_user_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/upload_photo_response_model.dart';

import '../../../api/core/api_request_models/edite_my_info/updated_user_request_model.dart';

abstract interface class EditeMyInfoOnlineDataSource {
  Future<UploadPhotoResponseModel> uploadPhoto({required String token, required File image});
  Future<UpdatedUserResponseModel> updateUserInfo({required String token, required UpdatedUserRequestModel updatedUserRequestModel});
}