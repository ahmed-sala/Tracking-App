import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utilities/functions/button_list.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_viewmodel.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/status_info_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/status_row_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/store_info_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/text_type_price_widget.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../widget/order_item_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _isBottomSheetVisible = true;

  @override
  Widget build(BuildContext context) {
    OrderDetailsViewmodel orderDetailsViewmodel =
        getIt<OrderDetailsViewmodel>();

    return BlocProvider(
      create: (context) => orderDetailsViewmodel..getOrderDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: BlocBuilder<OrderDetailsViewmodel, OrderDetailsState>(
          buildWhen: (previous, current) {
            return current is StateUpdated || current is OrderDetailsLoaded;
          },
          builder: (context, state) {
            if (state is OrderDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OrderDetailsLoaded) {
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification.metrics.pixels > 100 &&
                      _isBottomSheetVisible) {
                    setState(() {
                      _isBottomSheetVisible = false;
                    });
                  } else if (scrollNotification.metrics.pixels <= 100 &&
                      !_isBottomSheetVisible) {
                    setState(() {
                      _isBottomSheetVisible = true;
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const StatusRowWidget(),
                        verticalSpace(24),
                        StatusInfoWidget(order: state.order),
                        verticalSpace(16),
                        _buildSectionTitle('Pickup Address'),
                        verticalSpace(16),
                        StoreInfoWidget(
                          storeImage: state.order.storeOrderEntity?.image ?? '',
                          storeName: state.order.storeOrderEntity?.name ?? '',
                          storeAddress:
                              state.order.storeOrderEntity?.address ?? '',
                          onCall: () => orderDetailsViewmodel.openCallKeypad(
                              state.order.storeOrderEntity?.phoneNumber ?? ''),
                          onWhatsApp: () => orderDetailsViewmodel.openWhatsApp(
                              state.order.storeOrderEntity?.phoneNumber ?? ''),
                        ),
                        verticalSpace(24),
                        _buildSectionTitle('User Address'),
                        verticalSpace(16),
                        StoreInfoWidget(
                          storeImage: state.order.userOrderEntity?.image ?? '',
                          storeName:
                              state.order.userOrderEntity?.firstName ?? '',
                          storeAddress: 'sddsdssdsdsd',
                          onCall: () => orderDetailsViewmodel.openCallKeypad(
                              state.order.userOrderEntity?.phone ?? ''),
                          onWhatsApp: () => orderDetailsViewmodel.openWhatsApp(
                              state.order.userOrderEntity?.phone ?? ''),
                        ),
                        verticalSpace(24),
                        _buildSectionTitle('Order Details'),
                        verticalSpace(16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.order.orderItems?.length ?? 0,
                          itemBuilder: (context, index) {
                            final orderItem = state.order.orderItems?[index];
                            return OrderItemWidget(
                              orderImage: orderItem?.product?.imgCover ?? '',
                              orderPrice:
                                  orderItem?.product?.price?.toString() ?? '0',
                              orderQuantity: orderItem?.product?.quantity ?? 0,
                              orderTitle: orderItem?.product?.title ?? '',
                            );
                          },
                        ),
                        verticalSpace(24),
                        TextTypePriceWidget(
                            title: 'Total Price',
                            leading: 'Egp ${state.order.totalPrice}'),
                        verticalSpace(24),
                        TextTypePriceWidget(
                            title: 'Payment Type',
                            leading: '${state.order.paymentType}'),
                        verticalSpace(100), // To prevent bottom sheet overlap
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is OrderDetailsError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
        bottomSheet: _isBottomSheetVisible
            ? Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: BlocBuilder<OrderDetailsViewmodel, OrderDetailsState>(
                  builder: (context, state) {
                    if (state is StateUpdated || state is OrderDetailsLoaded) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () {
                          if (state is StateUpdated ||
                              state is OrderDetailsLoaded) {
                            var id = state is StateUpdated
                                ? state.order.id
                                : (state as OrderDetailsLoaded).order.id;

                            // Call updateState which now updates UI instantly
                            orderDetailsViewmodel.updateState(
                                id!, stateList[orderDetailsViewmodel.counter]);
                          }
                        },
                        child: Text(
                          state is StateUpdated
                              ? state.message // Instantly updated state message
                              : state is OrderDetailsLoaded
                                  ? stateList[orderDetailsViewmodel.counter]
                                  : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
