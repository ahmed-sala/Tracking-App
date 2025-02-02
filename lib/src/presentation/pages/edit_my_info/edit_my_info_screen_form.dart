import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import '../../../../core/utilities/style/app_text_styles.dart';
import '../../../../core/utilities/style/spacing.dart';
import '../../managers/Auth/change_password/change_password_actions.dart';
import '../../managers/edit_my_info/edit_my_info_actions.dart';
import '../../managers/edit_my_info/edite_my_info_view_model.dart';

class EditMyInfoScreenForm extends StatelessWidget {
  const EditMyInfoScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<EditeMyInfoViewModel>();

    return Form(
      key: _viewModel.formKey,
      child: Column(
        children: [
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller:
                      _viewModel.getController(EditeMyInfoFormFields.firstName),
                  decoration: InputDecoration(
                    labelText: context.localization.firstName,
                  ),
                  validator: (value) {
                    return _viewModel.getValidator(EditeMyInfoFormFields.firstName);
                  },
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: TextFormField(
                  controller:
                      _viewModel.getController(EditeMyInfoFormFields.lastName),
                  decoration: InputDecoration(
                    labelText: context.localization.lastName,
                  ),
                  validator: (value) {
                   return _viewModel.getValidator(EditeMyInfoFormFields.lastName);
                  },
                ),
              ),
            ],
          ),
          verticalSpace(24),
          TextFormField(
            controller: _viewModel.getController(EditeMyInfoFormFields.email),
            decoration: InputDecoration(labelText: context.localization.email),
            validator: (value) {
              _viewModel.getValidator(EditeMyInfoFormFields.email);
            },
          ),
          verticalSpace(24),
          TextFormField(
            validator: (value) {
             return _viewModel.getValidator(EditeMyInfoFormFields.phone);
            },
            controller: _viewModel.getController(EditeMyInfoFormFields.phone),
            decoration:
                InputDecoration(labelText: context.localization.phoneNumber),
          ),
          verticalSpace(24),
          TextFormField(
            controller:
                _viewModel.getController(EditeMyInfoFormFields.password),
            readOnly: true,
            decoration: InputDecoration(
                labelText: context.localization.password,
                suffix: InkWell(
                  onTap: () {
                    _viewModel.doAction(NavToChangePasswordAction());
                  },
                  child: Text(context.localization.change),
                )),
          ),
          verticalSpace(24),
          Row(
            children: [
              Text(
                context.localization.gender,
                style:
                    AppTextStyles.font18Medium.copyWith(color: AppColors.kGray),
              ),
              horizontalSpace(40),
              Radio<Gender>(
                activeColor: AppColors.kBaseColor,
                value: Gender.female,
                groupValue: _viewModel.selectedGender,
                onChanged: (value) {
                  _viewModel.selectedGender = value!;
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
                  _viewModel.selectedGender = value!;
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
                  disabledBackgroundColor: AppColors.kGray),
              onPressed: () {
                _viewModel.doAction(UpdateMyInfoAction());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  context.localization.update,
                  style: AppTextStyles.font16Medium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
