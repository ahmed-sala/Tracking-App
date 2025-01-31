
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/auth/auth_offline_data_source.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/edite_my_info/edite_my_info.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';
import 'package:tracking_app/src/domain/repositories/edit_my_info/edite_my_info_repo.dart';

@Injectable(as: EditeMyInfoRepo)
class EditeMyInfoRepoImpl implements EditeMyInfoRepo{
  final EditeMyInfoOnlineDataSource _editeMyInfoOnlineDataSource;
  final AuthOfflineDataSource _offlineDataSource;

  EditeMyInfoRepoImpl(this._editeMyInfoOnlineDataSource,this._offlineDataSource);
  @override
  Future<ApiResult<UploadPhotoEntity>> uploadPhoto({required File image})async {
    // String token = await _offlineDataSource.getToken()??"";
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzZkMWRkZTlmMzg4NGIzNDA1YzMwZGMiLCJpYXQiOjE3MzgxNjk5OTB9.KV2wvniwAVbUg6VxBQmijnYpVrLRGDkdkLuJVi24hCQ";
    return await executeApi<UploadPhotoEntity>(apiCall: ()async{
      var response = await _editeMyInfoOnlineDataSource.uploadPhoto(token: "Bearer $token", image: image);
      return response.toDomain();
    });
  }

}