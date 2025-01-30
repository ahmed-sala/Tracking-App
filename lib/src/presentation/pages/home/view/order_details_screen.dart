import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_viewmodel.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/status_info_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/status_row_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/store_info_widget.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../widget/order_item_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsViewmodel orderDetailsViewmodel =
        getIt<OrderDetailsViewmodel>();
    return BlocProvider(
      create: (context) => orderDetailsViewmodel..getOrderDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: BlocBuilder<OrderDetailsViewmodel, OrderDetailsState>(
          builder: (context, state) {
            if (state is OrderDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OrderDetailsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusRowWidget(),
                    verticalSpace(24),
                    StatusInfoWidget(order: state.order),
                    verticalSpace(16),
                    Text(
                      'Pickup Address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(16),
                    StoreInfoWidget(
                        storeImage: state.order.storeOrderEntity!.image,
                        storeName: state.order.storeOrderEntity!.name,
                        storeAddress: state.order.storeOrderEntity!.address!,
                        onCall: () => orderDetailsViewmodel.openCallKeypad(
                            state.order.storeOrderEntity!.phoneNumber!),
                        onWhatsApp: () => orderDetailsViewmodel.openWhatsApp(
                            state.order.storeOrderEntity!.phoneNumber!)),
                    verticalSpace(24),
                    Text(
                      'User Address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(16),
                    StoreInfoWidget(
                        storeImage: state.order.userOrderEntity!.image ?? '',
                        storeName: state.order.userOrderEntity!.firstName ?? '',
                        storeAddress: 'sddsdssdsdsd',
                        onCall: () => orderDetailsViewmodel.openCallKeypad(
                            state.order.userOrderEntity!.phone!),
                        onWhatsApp: () => orderDetailsViewmodel
                            .openWhatsApp(state.order.userOrderEntity!.phone!)),
                    verticalSpace(24),
                    Text(
                      'Order Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          var orderItem = state.order.orderItems?[index];

                          return OrderItemWidget(
                            orderImage: orderItem?.product?.imgCover ?? '',
                            orderPrice:
                                orderItem?.product?.price.toString() ?? '',
                            orderQuantity: orderItem?.product?.quantity ?? 0,
                            orderTitle: orderItem?.product?.title ?? '',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is OrderDetailsError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
