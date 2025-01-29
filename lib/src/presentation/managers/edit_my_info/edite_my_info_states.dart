abstract class EditeMyInfoStates{}

class EditeMyInfoScreenInitialState extends EditeMyInfoStates{}
class LoadingDriverInfoState extends EditeMyInfoStates{}
class LoadedDriverInfoState extends EditeMyInfoStates{}
class ErrorDriverInfoState extends EditeMyInfoStates{
  Exception? exception;
  ErrorDriverInfoState({this.exception});
}
class SuccessFormValidateState extends EditeMyInfoStates{}
class ErrorFormValidateState extends EditeMyInfoStates{
  String? message;
  ErrorFormValidateState({this.message});
}

class ChangePasswordState extends EditeMyInfoStates{}
