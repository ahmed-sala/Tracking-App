// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../src/data/api/api_services.dart' as _i318;
import '../../src/data/api/network_factory.dart' as _i801;
import '../../src/data/data_sources/offline_data_source/auth/auth_offline_data_source.dart'
    as _i252;
import '../../src/data/data_sources/offline_data_source/auth/auth_offline_data_source_impl.dart'
    as _i523;
import '../../src/data/data_sources/offline_data_source/country/counrty_offline_data_source_impl.dart'
    as _i532;
import '../../src/data/data_sources/offline_data_source/country/country_offline_data_source.dart'
    as _i472;
import '../../src/data/data_sources/offline_data_source/order/order_offline_datasource.dart'
    as _i839;
import '../../src/data/data_sources/offline_data_source/order/order_offline_datasource_impl.dart'
    as _i130;
import '../../src/data/data_sources/online_data_source/auth/auth_online_data_source.dart'
    as _i154;
import '../../src/data/data_sources/online_data_source/auth/auth_online_data_source_impl.dart'
    as _i956;
import '../../src/data/data_sources/online_data_source/edite_my_info/edite_my_info.dart'
    as _i718;
import '../../src/data/data_sources/online_data_source/edite_my_info/edite_my_info_impl.dart'
    as _i306;
import '../../src/data/data_sources/online_data_source/order/order_online_data_source.dart'
    as _i351;
import '../../src/data/data_sources/online_data_source/order/order_online_data_source_impl.dart'
    as _i654;
import '../../src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source.dart'
    as _i633;
import '../../src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source_impl.dart'
    as _i523;
import '../../src/data/repositories/auth/auth_repository_impl.dart' as _i188;
import '../../src/data/repositories/country/country_repo_impl.dart' as _i668;
import '../../src/data/repositories/edite_my_info/edite_my_info_repo_impl.dart'
    as _i151;
import '../../src/data/repositories/order/order_repository_impl.dart' as _i395;
import '../../src/data/repositories/vehicles/vehicles_repo_impl.dart' as _i732;
import '../../src/domain/repositories/auth/auth_repository.dart' as _i701;
import '../../src/domain/repositories/country/country_repo.dart' as _i597;
import '../../src/domain/repositories/edit_my_info/edite_my_info_repo.dart'
    as _i214;
import '../../src/domain/repositories/order/order_repository.dart' as _i176;
import '../../src/domain/repositories/vehicles/vehciles_repo.dart' as _i557;
import '../../src/domain/use_cases/change_password.dart' as _i982;
import '../../src/domain/use_cases/country/country_use_case.dart' as _i176;
import '../../src/domain/use_cases/forget_password/forget_password_use_cases.dart'
    as _i235;
import '../../src/domain/use_cases/get_profile_data_use_case.dart' as _i986;
import '../../src/domain/use_cases/log_out_use_case.dart' as _i333;
import '../../src/domain/use_cases/login_use_case.dart' as _i379;
import '../../src/domain/use_cases/order/get_all_pending_order_use_case.dart'
    as _i587;
import '../../src/domain/use_cases/order/order_details_usecase.dart' as _i150;
import '../../src/domain/use_cases/upload_photo_use_case.dart' as _i573;
import '../../src/domain/use_cases/vehicles/vehicles_use_cases.dart' as _i684;
import '../../src/presentation/managers/Auth/apply/apply_screen_view_model.dart'
    as _i675;
import '../../src/presentation/managers/Auth/apply/controller_manager.dart'
    as _i94;
import '../../src/presentation/managers/Auth/apply/validator_manager.dart'
    as _i195;
import '../../src/presentation/managers/Auth/change_password/change_password_view_model.dart'
    as _i895;
import '../../src/presentation/managers/Auth/forget_password/forget_password_screen_view_model.dart'
    as _i762;
import '../../src/presentation/managers/edit_my_info/edite_my_info_controller_manager.dart'
    as _i408;
import '../../src/presentation/managers/edit_my_info/edite_my_info_view_model.dart'
    as _i296;
import '../../src/presentation/managers/login/login_cubit.dart' as _i84;
import '../../src/presentation/managers/on_boarding/on_boarding_view_model.dart'
    as _i850;
import '../../src/presentation/managers/order/order_details/order_details_viewmodel.dart'
    as _i274;
import '../../src/presentation/managers/order/pending_order/pending_order_cubit.dart'
    as _i908;
import '../../src/presentation/managers/profile/profile_cubit.dart' as _i34;
import '../../src/presentation/managers/section/section_screen_viewmodel.dart'
    as _i265;
import '../helpers/firestore/firebase_module.dart' as _i991;
import '../helpers/firestore/firestore_services.dart' as _i769;
import '../helpers/shared_pref/shared_pref_moduel.dart' as _i802;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefModule = _$SharedPrefModule();
    final dioProvider = _$DioProvider();
    final firebaseModule = _$FirebaseModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i265.SectionScreenViewmodel>(
        () => _i265.SectionScreenViewmodel());
    gh.factory<_i94.ControllerManager>(() => _i94.ControllerManager());
    gh.factory<_i195.ValidatorManager>(() => _i195.ValidatorManager());
    gh.factory<_i408.EditeMyInfoControllerManager>(
        () => _i408.EditeMyInfoControllerManager());
    gh.factory<_i850.OnBoardingViewModel>(() => _i850.OnBoardingViewModel());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => sharedPrefModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseModule.firebaseFirestore);
    gh.factory<_i252.AuthOfflineDataSource>(
        () => _i523.AuthOfflineDataSourceImpl());
    gh.singleton<_i318.ApiServices>(() => _i318.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i472.CountryOfflineDataSource>(
        () => _i532.CountryOfflineDataSourceImpl());
    gh.factory<_i839.OrderOfflineDatasource>(
        () => _i130.OrderOfflineDatasourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i769.FirestoreService>(
        () => _i769.FirestoreService(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i633.VehiclesOnlineDataSource>(
        () => _i523.VehiclesOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i597.CountryRepo>(
        () => _i668.CountryRepoImpl(gh<_i472.CountryOfflineDataSource>()));
    gh.factory<_i718.EditeMyInfoOnlineDataSource>(
        () => _i306.EditeMyInfoOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i154.AuthOnlineDataSource>(
        () => _i956.AuthOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i176.CountryUseCase>(
        () => _i176.CountryUseCase(gh<_i597.CountryRepo>()));
    gh.factory<_i351.OrderOnlineDataSource>(
        () => _i654.OrderOnlineDataSourceImpl(
              gh<_i318.ApiServices>(),
              gh<_i769.FirestoreService>(),
            ));
    gh.factory<_i214.EditeMyInfoRepo>(() => _i151.EditeMyInfoRepoImpl(
          gh<_i718.EditeMyInfoOnlineDataSource>(),
          gh<_i252.AuthOfflineDataSource>(),
        ));
    gh.factory<_i701.AuthRepository>(() => _i188.AuthRepositoryImpl(
          gh<_i154.AuthOnlineDataSource>(),
          gh<_i252.AuthOfflineDataSource>(),
        ));
    gh.factory<_i557.VehiclesRepo>(
        () => _i732.VehicleRepoImpl(gh<_i633.VehiclesOnlineDataSource>()));
    gh.factory<_i176.OrderRepository>(() => _i395.OrderRepositoryImpl(
          gh<_i351.OrderOnlineDataSource>(),
          gh<_i839.OrderOfflineDatasource>(),
        ));
    gh.factory<_i573.UploadPhotoUseCase>(
        () => _i573.UploadPhotoUseCase(gh<_i214.EditeMyInfoRepo>()));
    gh.factory<_i587.GetAllPendingOrderUseCase>(() =>
        _i587.GetAllPendingOrderUseCase(
            orderRepository: gh<_i176.OrderRepository>()));
    gh.factory<_i235.AuthUseCases>(
        () => _i235.AuthUseCases(gh<_i701.AuthRepository>()));
    gh.factory<_i333.LogOutUseCase>(
        () => _i333.LogOutUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i379.LoginUseCase>(
        () => _i379.LoginUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i982.ChangePasswordUseCase>(
        () => _i982.ChangePasswordUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i986.GetProfileDataUseCase>(() => _i986.GetProfileDataUseCase(
        authRepository: gh<_i701.AuthRepository>()));
    gh.factory<_i684.VehiclesUseCases>(
        () => _i684.VehiclesUseCases(gh<_i557.VehiclesRepo>()));
    gh.factory<_i150.OrderDetailsUsecase>(
        () => _i150.OrderDetailsUsecase(gh<_i176.OrderRepository>()));
    gh.factory<_i762.ForgetPasswordScreenViewModel>(
        () => _i762.ForgetPasswordScreenViewModel(gh<_i235.AuthUseCases>()));
    gh.factory<_i908.PendingOrderCubit>(
        () => _i908.PendingOrderCubit(gh<_i587.GetAllPendingOrderUseCase>()));
    gh.factory<_i274.OrderDetailsViewmodel>(
        () => _i274.OrderDetailsViewmodel(gh<_i150.OrderDetailsUsecase>()));
    gh.factory<_i84.LoginCubit>(
        () => _i84.LoginCubit(gh<_i379.LoginUseCase>()));
    gh.factory<_i895.ChangePasswordViewModel>(
        () => _i895.ChangePasswordViewModel(gh<_i982.ChangePasswordUseCase>()));
    gh.factory<_i296.EditeMyInfoViewModel>(() => _i296.EditeMyInfoViewModel(
          gh<_i408.EditeMyInfoControllerManager>(),
          gh<_i986.GetProfileDataUseCase>(),
          gh<_i573.UploadPhotoUseCase>(),
        ));
    gh.factory<_i675.ApplyScreenViewModel>(() => _i675.ApplyScreenViewModel(
          gh<_i684.VehiclesUseCases>(),
          gh<_i94.ControllerManager>(),
          gh<_i176.CountryUseCase>(),
        ));
    gh.factory<_i34.ProfileCubit>(
        () => _i34.ProfileCubit(gh<_i986.GetProfileDataUseCase>()));
    return this;
  }
}

class _$SharedPrefModule extends _i802.SharedPrefModule {}

class _$DioProvider extends _i801.DioProvider {}

class _$FirebaseModule extends _i991.FirebaseModule {}
