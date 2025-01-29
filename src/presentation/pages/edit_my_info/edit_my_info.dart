import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_states.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_view_model.dart';
import 'package:tracking_app/src/presentation/pages/edit_my_info/edite_my_profile_body.dart';
import 'package:tracking_app/src/presentation/shared_widgets/error_view.dart';
import 'package:tracking_app/src/presentation/pages/edit_my_info/loading_shimmer.dart';
import 'package:tracking_app/src/tracking_app.dart';

import '../../../../core/common/common_imports.dart';

class EditMyInfo extends StatelessWidget {
  EditMyInfo({super.key});

  final viewModel = getIt<EditeMyInfoViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        viewModel.doAction(LoadDriverInfoAction());
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            context.localization.editProfile,
            style: AppTextStyles.font20Medium,
          ),
        ),
        body: BlocConsumer<EditeMyInfoViewModel, EditeMyInfoStates>(
            builder: (context, state) {
          if (state is LoadingDriverInfoState) {
            return const LoadingShimmer();
          }
          if (state is LoadedDriverInfoState) {
            return const EditeMyProfileBody();
          }
          if (state is ErrorDriverInfoState) {
            String errorMessage = ErrorHandler.fromException(
                    state.exception!, AppLocalizations.of(context)!)
                .errorMassage;
            return ErrorView(errorMessage: errorMessage,viewModel: viewModel,);
          }
          return const EditeMyProfileBody();
        }, listener: (context, state) {
          if (state is ChangePasswordState) {
            navKey.currentState!.pushNamed(PageRoutesName.changePassword);
          }
        }),
      ),
    );
  }
}
