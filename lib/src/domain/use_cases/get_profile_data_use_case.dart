import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';

import '../entities/app_user_entity.dart';
import '../entities/auth/log_out_entity.dart';
import '../repositories/auth/auth_repository.dart';

@injectable
class GetProfileDataUseCase {
  final AuthRepository authRepository;
  GetProfileDataUseCase({required this.authRepository});

  Future<ApiResult<AppUserEntity>> invoke() async {
    return await authRepository.getProfileData();
  }

  Future<ApiResult<LogOutEntity>> logOut() async {
    return await authRepository.logOut();
  }
}
