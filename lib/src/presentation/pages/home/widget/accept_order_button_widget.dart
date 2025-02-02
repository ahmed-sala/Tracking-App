import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/dialogs/toast_dialoge.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import '../../../managers/order/start_order/start_order_cubit.dart';
import '../../../managers/order/start_order/start_order_event.dart';
import 'action_button_widget.dart';

class AcceptOrderButtonWidget extends StatefulWidget {
  final PendingOrderEntity pendingOrderEntity;
  const AcceptOrderButtonWidget({super.key, required this.pendingOrderEntity});
  @override
  State<AcceptOrderButtonWidget> createState() => _AcceptOrderIconState();
}

class _AcceptOrderIconState extends State<AcceptOrderButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var startViewModel = context.read<StartOrderCubit>();
    return BlocConsumer<StartOrderCubit, StartOrderState>(
        listener: (context, state) =>
            _handleBlocListenerState(state, context, startViewModel),
        builder: (context, state) =>
            _handleBlocBuilderStartState(state, context, startViewModel));
  }

  Widget _handleBlocBuilderStartState(StartOrderState state,
      BuildContext context, StartOrderCubit startViewModel) {
    if (state is StoreOrderLoadingState || state is StartOrderLoadingState) {
      return const Center(
          child: CircularProgressIndicator(
        color: AppColors.mainColor,
      ));
    } else {
      return ActionButtonWidget(
          title: context.localizations.accept,
          onPressed: () => startViewModel.doAction(InitialStartOrderEvent(
              pendingOrderEntity: widget.pendingOrderEntity)),
          backGroundColor: AppColors.mainColor,
          textColor: AppColors.kWhiteBase);
    }
  }

  void _handleBlocListenerState(StartOrderState state, BuildContext context,
      StartOrderCubit startViewModel) {
    if (state is StoreOrderSuccessState) {
      startViewModel.doAction(
          StartOrderButtonEvent(orderId: widget.pendingOrderEntity.id ?? ""));
    } else if (state is StoreOrderErrorState) {
      ToastDialog.show(
          ErrorHandler.fromException(state.exception, context.localizations)
              .errorMessage);
    } else if (state is StartOrderSuccessState) {
      return _goNextOrderDetails();
    } else if (state is StartOrderErrorState) {
      ToastDialog.show(
          ErrorHandler.fromException(state.exception, context.localizations)
              .errorMessage);
    }
  }

  void _goNextOrderDetails() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRoutesName.orderDetailsScreen,
      (route) => false,
    );
  }
}
