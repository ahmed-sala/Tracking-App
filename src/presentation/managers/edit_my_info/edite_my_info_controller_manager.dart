import 'package:injectable/injectable.dart';

import '../../../../core/common/common_imports.dart';
import 'edite_my_info_view_model.dart';

@injectable
@singleton
class EditeMyInfoControllerManager {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController  =  TextEditingController(
    text: "*****"
  );

  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  TextEditingController getController(EditeMyInfoFormFields form) {
    switch (form) {
      case EditeMyInfoFormFields.firstName:
        return _firstNameController;
      case EditeMyInfoFormFields.lastName:
        return _firstNameController;
      case EditeMyInfoFormFields.email:
        return _emailController;
      case EditeMyInfoFormFields.phone:
        return _phoneController;
      case EditeMyInfoFormFields.password:
        return _passwordController;
    }
  }

  void setController(EditeMyInfoFormFields form, String value) {
    switch (form) {
      case EditeMyInfoFormFields.firstName:
        _firstNameController.text = value;
        break;
      case EditeMyInfoFormFields.lastName:
        _firstNameController.text = value;
        break;
      case EditeMyInfoFormFields.email:
        _emailController.text = value;
        break;
      case EditeMyInfoFormFields.phone:
        _phoneController.text = value;
        break;
      case EditeMyInfoFormFields.password:
        break;
    }
  }
}
