import '../../../domain/entities/app_user_entity.dart';

abstract class EditeMyInfoStates{}

class EditeMyInfoScreenInitialState extends EditeMyInfoStates{}
class LoadingDriverInfoState extends EditeMyInfoStates{}
class LoadedDriverInfoState extends EditeMyInfoStates{
}
class ErrorDriverInfoState extends EditeMyInfoStates{
  Exception? exception;
  ErrorDriverInfoState({this.exception});
}
class SuccessFormValidateState extends EditeMyInfoStates{

}
class ErrorFormValidateState extends EditeMyInfoStates{
  String? message;
  ErrorFormValidateState({this.message});
}

class ChangePasswordState extends EditeMyInfoStates{}
class UploadPhotoSuccessState extends EditeMyInfoStates{}
class UploadPhotoLoadingState extends EditeMyInfoStates{}
class UploadPhotoErrorState extends EditeMyInfoStates{
  Exception? exception;
  UploadPhotoErrorState({this.exception});
}
