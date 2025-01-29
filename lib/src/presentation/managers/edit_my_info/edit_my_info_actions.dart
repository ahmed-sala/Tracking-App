import 'dart:io';

sealed class EditeMyInfoActions{}
class LoadDriverInfoAction extends EditeMyInfoActions{}
class ChangePasswordAction extends EditeMyInfoActions{}
class UploadPhotoAction extends EditeMyInfoActions{
  final File image;

  UploadPhotoAction({required this.image});
}