import 'package:fluttertoast/fluttertoast.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';

import '../../common/common_imports.dart';

class ToastDialog  {

  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kRed,
      textColor: AppColors.kWhiteBase,
      fontSize: 16.0,
    );
  }
}

