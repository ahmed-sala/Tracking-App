
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';
import 'package:tracking_app/src/domain/repositories/edit_my_info/edite_my_info_repo.dart';

@injectable
class UploadPhotoUseCase{
  final EditeMyInfoRepo _editeMyInfoRepo;

  UploadPhotoUseCase(this._editeMyInfoRepo);

  Future<ApiResult<UploadPhotoEntity>> uploadPhoto({required File image}) async{
    return await _editeMyInfoRepo.uploadPhoto(image: image);
  }
}