import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../managers/order/order_details/order_details_viewmodel.dart';
import '../widget/order_item_widget.dart';
import '../widget/status_info_widget.dart';
import '../widget/status_row_widget.dart';
import '../widget/store_info_widget.dart';
import '../widget/text_type_price_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  var viewModel = getIt.get<OrderDetailsViewmodel>();
  bool _isBottomSheetVisible = true;

  @override
  void initState() {
    viewModel.getOrderDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: BlocConsumer<OrderDetailsViewmodel, OrderDetailsState>(
          listener: (context, state) {
            if (state is UpdateStateLoaded) {
              viewModel.getOrderDetails();
            }
          },
          builder: (context, state) {
            if (state is UpdateStateLoading ||
                state is GetOrderDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UpdateStateError ||
                state is GetOrderDetailsError) {
              return const Center(child: Text("Error"));
            } else {
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
                        StatusInfoWidget(
                          status: viewModel.orderDetails.state ?? '',
                          orderId: viewModel.orderDetails.id?.toString() ?? '',
                          createdAt:
                              viewModel.orderDetails.createdAt?.toString() ??
                                  '',
                        ),
                        verticalSpace(16),
                        _buildSectionTitle('Pickup Address'),
                        verticalSpace(16),
                        StoreInfoWidget(
                          storeImage:
                              viewModel.orderDetails.storeOrderEntity?.image ??
                                  '',
                          storeName:
                              viewModel.orderDetails.storeOrderEntity?.name ??
                                  '',
                          storeAddress: viewModel
                                  .orderDetails.storeOrderEntity?.address
                                  ?.toString() ??
                              '',
                          onCall: () {
                            if (viewModel.orderDetails.storeOrderEntity
                                    ?.phoneNumber !=
                                null) {
                              viewModel.openCallKeypad(viewModel
                                  .orderDetails.storeOrderEntity!.phoneNumber
                                  .toString());
                            }
                          },
                          onWhatsApp: () {
                            if (viewModel.orderDetails.storeOrderEntity
                                    ?.phoneNumber !=
                                null) {
                              viewModel.openWhatsApp(viewModel
                                  .orderDetails.storeOrderEntity!.phoneNumber
                                  .toString());
                            }
                          },
                        ),
                        verticalSpace(24),
                        _buildSectionTitle('User Address'),
                        verticalSpace(16),
                        StoreInfoWidget(
                          storeImage:
                              viewModel.orderDetails.userOrderEntity?.image ??
                                  '',
                          storeName: viewModel
                                  .orderDetails.userOrderEntity?.firstName ??
                              '',
                          storeAddress: 'sddsdssdsdsd',
                          onCall: () {
                            if (viewModel.orderDetails.userOrderEntity?.phone !=
                                null) {
                              viewModel.openCallKeypad(viewModel
                                  .orderDetails.userOrderEntity!.phone
                                  .toString());
                            }
                          },
                          onWhatsApp: () {
                            if (viewModel.orderDetails.userOrderEntity?.phone !=
                                null) {
                              viewModel.openWhatsApp(viewModel
                                  .orderDetails.userOrderEntity!.phone
                                  .toString());
                            }
                          },
                        ),
                        verticalSpace(24),
                        _buildSectionTitle('Order Details'),
                        verticalSpace(16),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              viewModel.orderDetails.orderItems?.length ?? 0,
                          itemBuilder: (context, index) {
                            final orderItem =
                                viewModel.orderDetails.orderItems?[index];
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
                          leading:
                              'Egp ${viewModel.orderDetails.totalPrice ?? ''}',
                        ),
                        verticalSpace(24),
                        TextTypePriceWidget(
                          title: 'Payment Type',
                          leading: viewModel.orderDetails.paymentType ?? '',
                        ),
                        verticalSpace(100),
                      ],
                    ),
                  ),
                ),
              );
            }
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
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        viewModel.updateState(viewModel.orderDetails);
                      },
                      child: Text(
                        viewModel.btnTxt,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
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
