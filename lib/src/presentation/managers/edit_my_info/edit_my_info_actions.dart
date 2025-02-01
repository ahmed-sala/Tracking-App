import 'dart:io';

sealed class EditeMyInfoActions{}
class LoadDriverInfoAction extends EditeMyInfoActions{}
class NavToChangePasswordAction extends EditeMyInfoActions{}
class UploadPhotoAction extends EditeMyInfoActions{
  final File image;

  UploadPhotoAction({required this.image});
}

class UpdateMyInfoAction extends EditeMyInfoActions{}