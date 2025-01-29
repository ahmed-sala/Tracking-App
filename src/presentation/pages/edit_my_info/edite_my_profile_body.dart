import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_view_model.dart';

import '../../../../core/common/common_imports.dart';

class EditeMyProfileBody extends StatefulWidget {
  const EditeMyProfileBody({super.key});

  @override
  State<EditeMyProfileBody> createState() => _EditeMyProfileBodyState();
}

class _EditeMyProfileBodyState extends State<EditeMyProfileBody> {
  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<EditeMyInfoViewModel>();
    AppUserEntity appUser = _viewModel.appUserEntity;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        width: context.width,
        child: Column(
          children: [
            InkWell(
              onTap: ()async{
                var image = await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);
              },
              child: ClipRRect(
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
              ),
            ),
            Form(
              key: _viewModel.formKey,
              child: Column(
                children: [
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _viewModel
                              .getController(EditeMyInfoFormFields.firstName),
                          decoration: InputDecoration(
                            labelText: context.localization.firstName,
                          ),
                          validator: (value){},
                          onChanged: (value){},
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: TextFormField(
                          controller: _viewModel
                              .getController(EditeMyInfoFormFields.lastName),
                          decoration: InputDecoration(
                            labelText: context.localization.lastName,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller:
                        _viewModel.getController(EditeMyInfoFormFields.email),
                    decoration:
                        InputDecoration(labelText: context.localization.email),
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller:
                        _viewModel.getController(EditeMyInfoFormFields.phone),
                    decoration: InputDecoration(
                        labelText: context.localization.phoneNumber),
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: _viewModel
                        .getController(EditeMyInfoFormFields.password),
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: context.localization.password,
                        suffix: InkWell(
                          onTap: () {
                            _viewModel.doAction(ChangePasswordAction());
                          },
                          child: Text(context.localization.change),
                        )),
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Text(
                        context.localization.gender,
                        style: AppTextStyles.font18Medium
                            .copyWith(color: AppColors.kGray),
                      ),
                      horizontalSpace(40),
                      Radio<Gender>(
                        activeColor: AppColors.kBaseColor,
                        value: Gender.female,
                        groupValue: _viewModel.selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _viewModel.selectedGender = value!;
                          });
                        },
                      ),
                      Text(
                        context.localization.female,
                        style: AppTextStyles.font14Regular,
                      ),
                      Radio<Gender>(
                        activeColor: AppColors.kBaseColor,
                        value: Gender.male,
                        groupValue: _viewModel.selectedGender,
                        onChanged: (value) {
                            setState(() {
                              _viewModel.selectedGender = value!;
                            });
                        },
                      ),
                      Text(
                        context.localization.male,
                        style: AppTextStyles.font14Regular,
                      )
                    ],
                  ),
                  verticalSpace(40),
                  SizedBox(
                    width: context.width,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         disabledBackgroundColor: AppColors.kGray
                       ),
                        onPressed: ()=> null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            context.localization.update,
                            style: AppTextStyles.font16Medium,
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
