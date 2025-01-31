
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/domain/entities/edite_my_info/upload_photo_entity.dart';
import 'package:tracking_app/src/domain/use_cases/upload_photo_use_case.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_states.dart';

import '../../../domain/use_cases/get_profile_data_use_case.dart';
import 'edite_my_info_controller_manager.dart';


@injectable
class EditeMyInfoViewModel extends Cubit<EditeMyInfoStates>{

  final EditeMyInfoControllerManager _controllerManager;
  final GetProfileDataUseCase _getProfileDataUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;
  EditeMyInfoViewModel(this._controllerManager,this._getProfileDataUseCase,this._uploadPhotoUseCase) : super(EditeMyInfoScreenInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.male;
  AppUserEntity _appUserEntity = AppUserEntity();
  AppUserEntity get appUserEntity => _appUserEntity;
  String? driverImage;
  TextEditingController getController(EditeMyInfoFormFields form){
    return _controllerManager.getController(form);
  }

  void setController(EditeMyInfoFormFields form, String value){
    _controllerManager.setController(form, value);
  }

  _setUserData(){
    setController(EditeMyInfoFormFields.firstName, _appUserEntity.firstName??"");
    setController(EditeMyInfoFormFields.lastName, _appUserEntity.lastName??"" );
    setController(EditeMyInfoFormFields.email, _appUserEntity.email??"");
    setController(EditeMyInfoFormFields.phone, _appUserEntity.phone??"");
    selectedGender =_appUserEntity.gender!.length == 4? Gender.male : Gender.female;
    driverImage = _appUserEntity.photo;
  }

  _LoadDriverInfo()async{
    emit(LoadingDriverInfoState());
    var result = await _getProfileDataUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity>():
         _appUserEntity = result.data??AppUserEntity();
         _setUserData();
        emit(LoadedDriverInfoState());
        break;
      case Failures<AppUserEntity>():
        emit(ErrorDriverInfoState(exception: result.exception));
        break;
    }

  }


  _uploadPhoto(File image) async{
    emit(UploadPhotoLoadingState());
    var result = await _uploadPhotoUseCase.uploadPhoto(image: image);
    switch (result) {
      case Success<UploadPhotoEntity>():
        driverImage = image.path;
        emit(UploadPhotoSuccessState());
        break;
      case Failures<UploadPhotoEntity>():
        emit(UploadPhotoErrorState(exception: result.exception));
        break;
    }
  }
  void doAction(EditeMyInfoActions action){
    switch (action) {
      case LoadDriverInfoAction():
        _LoadDriverInfo();
        break;
      case NavToChangePasswordAction():
        emit(ChangePasswordState());
        break;
      case UploadPhotoAction():
        _uploadPhoto(action.image);
        break;
    }
  }
}

enum Gender{
  male,
  female
}

enum EditeMyInfoFormFields{
  firstName,
  lastName,
  email,
  phone,
  password
}