
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/upload_photo_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/edite_my_info/edite_my_info.dart';

@Injectable(as: EditeMyInfoOnlineDataSource)
class EditeMyInfoOnlineDataSourceImpl implements EditeMyInfoOnlineDataSource{

  final ApiServices _apiServices;
  EditeMyInfoOnlineDataSourceImpl(this._apiServices);
  @override
  Future<UploadPhotoResponseModel> uploadPhoto({required String token, required File image})async {
    return await  _apiServices.uploadPhoto(token, image);
  }

}