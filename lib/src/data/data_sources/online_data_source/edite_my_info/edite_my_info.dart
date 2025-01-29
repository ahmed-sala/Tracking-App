
import 'dart:io';

import 'package:tracking_app/src/data/api/core/api_response_models/upload_photo_response_model.dart';

abstract interface class EditeMyInfoOnlineDataSource {
  Future<UploadPhotoResponseModel> uploadPhoto({required String token, required File image});
}