import 'dart:io';

import 'package:tracking_app/src/presentation/managers/core/base_action.dart';

sealed class EditeMyInfoActions extends BaseAction{}
class LoadDriverInfoAction extends EditeMyInfoActions{}
class NavToChangePasswordAction extends EditeMyInfoActions{}
class UploadPhotoAction extends EditeMyInfoActions{
  final File image;

  UploadPhotoAction({required this.image});
}

class UpdateMyInfoAction extends EditeMyInfoActions{}