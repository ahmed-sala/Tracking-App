import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_states.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_view_model.dart';
import 'package:tracking_app/src/presentation/pages/edit_my_info/edite_my_profile_body.dart';

import '../../../../core/common/common_imports.dart';

class EditMyInfo extends StatelessWidget {
  EditMyInfo({super.key});

  final viewModel = getIt<EditeMyInfoViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<EditeMyInfoViewModel, EditeMyInfoStates>(
            builder: (context, state) {
              return const EditeMyProfileBody();
            }, listener: (context, state) {}),
      ),
    );
  }
}
