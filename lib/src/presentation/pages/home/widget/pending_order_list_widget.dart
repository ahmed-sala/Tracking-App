import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pending_order_item_widget.dart';

import '../../../managers/order/pending_order/pending_order_cubit.dart';

class PendingOrderListWidget extends StatelessWidget {
  const PendingOrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pendingViewModel = context.read<PendingOrderCubit>();
    return BlocBuilder<PendingOrderCubit, PendingOrderState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) => verticalSpace(24),
          itemBuilder: (context, index) {
            return PendingOrderItemWidget(
              pendingOrderEntity: pendingViewModel.pendingOrder[index],
            );
          },
          itemCount: pendingViewModel.pendingOrder.length,
        );
      },
    );
  }
}
