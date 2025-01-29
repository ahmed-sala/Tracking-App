
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_states.dart';

import 'edite_my_info_controller_manager.dart';


@injectable
class EditeMyInfoViewModel extends Cubit<EditeMyInfoStates>{

  final EditeMyInfoControllerManager _controllerManager;
  EditeMyInfoViewModel(this._controllerManager) : super(EditeMyInfoScreenInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.male;
  TextEditingController getController(EditeMyInfoFormFields form){
    return _controllerManager.getController(form);
  }

  void setController(EditeMyInfoFormFields form, String value){
    _controllerManager.setController(form, value);
  }
  _LoadDriverInfo()async{
    emit(LoadingDriverInfoState());

  }
  void doAction(EditeMyInfoActions action){
    switch (action) {
      case LoadDriverInfo():
        _LoadDriverInfo();
        break;
      case ChangePasswordAction():
        emit(ChangePasswordState());
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
}