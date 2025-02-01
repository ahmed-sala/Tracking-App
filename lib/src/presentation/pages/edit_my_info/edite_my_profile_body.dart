import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_view_model.dart';

import '../../../../core/common/common_imports.dart';
import '../../managers/edit_my_info/edite_my_info_states.dart';
import 'edit_my_info_screen_form.dart';

class EditeMyProfileBody extends StatefulWidget {
  const EditeMyProfileBody({super.key});

  @override
  State<EditeMyProfileBody> createState() => _EditeMyProfileBodyState();
}

class _EditeMyProfileBodyState extends State<EditeMyProfileBody> {
  @override
  Widget build(BuildContext context) {
    final _viewModel = context.watch<
        EditeMyInfoViewModel>(); // Use `watch` to rebuild on changes
    AppUserEntity appUser = _viewModel.appUserEntity;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        width: context.width,
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                // Pick an image from the gallery
                var image = await ImagePicker.platform
                    .getImageFromSource(source: ImageSource.gallery);
                if (image != null) {
                  File newImage = File(image.path);
                  _viewModel.doAction(UploadPhotoAction(image: newImage));
                }
              },
              child: appUser.photo != null
                  ? Stack(
                children: [
                  _networkImage(appUser.photo),
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(Icons.camera_alt),
                  ),
                ],
              )
                  : _defaultImage(),
            ),
            const EditMyInfoScreenForm(),
          ],
        ),
      ),
    );
  }

  Widget _networkImage(String? photoUrl) {
    return photoUrl == null
        ? _defaultImage()
        : ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: CachedNetworkImage(
          imageUrl: photoUrl,
        ),
      ),
    );
  }

  Widget _defaultImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 100.h,
        width: 100.w,
        color: AppColors.kGray,
        child: const Icon(
          Icons.camera_alt,
          size: 40,
        ),
      ),
    );
  }
}

