import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_viewmodel.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class StatusInfoWidget extends StatelessWidget {
  const StatusInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsViewmodel, OrderDetailsState>(
      builder: (context, state) {
        if (state is OrderDetailsLoaded) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF9ECF0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status : ${state.order.state}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(8),
                Text(
                  "Order ID : # ${state.order.id}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(8),
                Text(
                  state.order.createdAt!,
                  style: TextStyle(
                    color: Color(0xFF535353),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
