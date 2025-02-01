import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/updated_user_info_request_entity.dart';
import 'package:tracking_app/src/domain/repositories/edit_my_info/edite_my_info_repo.dart';

@injectable
class UpdateProfileUseCase {
  final EditeMyInfoRepo _editeMyInfoRepo;

  UpdateProfileUseCase(this._editeMyInfoRepo);

  Future<ApiResult<AppUserEntity>> updateUserInfo(
      UpdatedUserInfoRequestEntity updatedUserInfoRequestEntity) async {
    return await _editeMyInfoRepo.updateUserInfo(
        updatedUserInfoRequestEntity: updatedUserInfoRequestEntity);
  }
}
