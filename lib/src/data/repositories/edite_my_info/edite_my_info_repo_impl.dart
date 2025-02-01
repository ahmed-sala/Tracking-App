import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/edite_my_info/updated_user_request_model.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/auth/auth_offline_data_source.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/edite_my_info/edite_my_info.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/updated_user_info_request_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';
import 'package:tracking_app/src/domain/repositories/edit_my_info/edite_my_info_repo.dart';

@Injectable(as: EditeMyInfoRepo)
class EditeMyInfoRepoImpl implements EditeMyInfoRepo {
  final EditeMyInfoOnlineDataSource _editeMyInfoOnlineDataSource;
  final AuthOfflineDataSource _offlineDataSource;

  EditeMyInfoRepoImpl(
      this._editeMyInfoOnlineDataSource, this._offlineDataSource);

  @override
  Future<ApiResult<UploadPhotoEntity>> uploadPhoto(
      {required File image}) async {
    String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzZkMWRkZTlmMzg4NGIzNDA1YzMwZGMiLCJpYXQiOjE3Mzg0MzA3NzN9.C8MdrTZ4pcaDpI85fCjUHJFbRKu_vKaUZa2ijL4gHc0";
    // String token = await _getToken();
    return await executeApi<UploadPhotoEntity>(apiCall: () async {
      var response = await _editeMyInfoOnlineDataSource.uploadPhoto(
          token: "Bearer $token", image: image);
      return response.toDomain();
    });
  }

  Future<String> _getToken() async {
    return await _offlineDataSource.getToken() ?? "";
  }

  @override
  Future<ApiResult<AppUserEntity>> updateUserInfo(
      {required UpdatedUserInfoRequestEntity
          updatedUserInfoRequestEntity}) async {
    // String token = await _getToken();
    String token ="Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzZkMWRkZTlmMzg4NGIzNDA1YzMwZGMiLCJpYXQiOjE3Mzg0MzA3NzN9.C8MdrTZ4pcaDpI85fCjUHJFbRKu_vKaUZa2ijL4gHc0";
    return await executeApi<AppUserEntity>(apiCall: () async {
      var response = await _editeMyInfoOnlineDataSource.updateUserInfo(
          token: token,
          updatedUserRequestModel:
              UpdatedUserRequestModel.fromEntity(updatedUserInfoRequestEntity));
      return response.toDomain();
    });
  }
}
