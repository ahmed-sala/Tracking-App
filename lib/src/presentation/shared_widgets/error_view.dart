import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_animations.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';

import '../managers/core/base_action.dart';
class ErrorView extends StatelessWidget {
  final String errorMessage;
  final viewModel;
   final  BaseAction action;
  const ErrorView({super.key, required this.errorMessage,required this.viewModel,required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(AppAnimations.error),
            Text(errorMessage,textAlign: TextAlign.center,style: AppTextStyles.font20Medium,),
            verticalSpace(40),
            IconButton(
                onPressed: () {
                  viewModel.doAction(action);
                },
                icon:  const Icon(Icons.refresh,size: 100,color: AppColors.kBaseColor,))
          ],
        ),
      ),
    );
  }
}
