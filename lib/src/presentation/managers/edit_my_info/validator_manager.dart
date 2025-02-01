
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_view_model.dart';

@injectable
@singleton
class EditeMyInfoValidatorManager{


  String? _validateField(String value){
    if(value.isEmpty || value == null){
      return "This field is required";
    }
    return null;
  }

  String? _validateEmail(String email){
    if(email.isEmpty  || email == null || !AppRegex.isEmailValid(email)){
      return "Invalid email";
    }
    return null;
  }

  String? _validatePhone(String phone){
    if(phone.isEmpty || phone == null || !AppRegex.isPhoneNumberValid(phone)){
      return "Invalid phone number";
    }
    return null;
  }

  String? validFields(EditeMyInfoFormFields field,String value){
    switch (field) {
      case EditeMyInfoFormFields.firstName:
        return _validateField(value);
      case EditeMyInfoFormFields.lastName:
        return _validateField(value);
      case EditeMyInfoFormFields.email:
        return _validateEmail(value);
      case EditeMyInfoFormFields.phone:
        return _validatePhone(value);
      case EditeMyInfoFormFields.password:
        return null;
    }
  }
}