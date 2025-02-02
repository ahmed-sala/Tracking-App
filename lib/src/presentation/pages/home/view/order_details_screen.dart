import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/order_details/button_order_details.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/order_details/section_title.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/functions/button_list.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../managers/order/order_details/order_details_viewmodel.dart';
import '../widget/order_details/info_widget.dart';
import '../widget/order_details/order_item_widget.dart';
import '../widget/order_details/status_info_widget.dart';
import '../widget/order_details/status_row_widget.dart';
import '../widget/order_details/text_type_price_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final viewModel = getIt.get<OrderDetailsViewmodel>();

  @override
  void initState() {
    super.initState();
    viewModel.getOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderDetailsViewmodel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(context.localization.orderDetails)),
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
            }

            if (state is UpdateStateError) {
              var message = ErrorHandler.fromException(
                  state.exception, context.localizations);
              return Center(child: Text(message.errorMessage));
            }

            final orderDetails = viewModel.orderDetails;
            if (orderDetails == null) {
              return Center(
                  child: Text(context.localization.noOrderDetailsAvailable));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusRowWidget(
                    currentState: orderDetails.state ?? '',
                    states: stateList, // Pass the list of states from ViewModel
                  ),
                  verticalSpace(24),
                  StatusInfoWidget(
                    status: orderDetails.state ?? '',
                    orderId: orderDetails.id?.toString() ?? '',
                    createdAt: orderDetails.createdAt?.toString() ?? '',
                  ),
                  verticalSpace(16),
                  SectionTitle(title: context.localization.storeAddress),
                  verticalSpace(16),
                  InfoWidget(
                    image: orderDetails.storeOrderEntity?.image ?? '',
                    name: orderDetails.storeOrderEntity?.name ?? '',
                    address: orderDetails.storeOrderEntity?.address ?? '',
                    onCall: () {
                      final phone = orderDetails.storeOrderEntity?.phoneNumber;
                      if (phone != null) {
                        viewModel.openCallKeypad(phone);
                      }
                    },
                    onWhatsApp: () {
                      final phone = orderDetails.storeOrderEntity?.phoneNumber;
                      if (phone != null) {
                        viewModel.openWhatsApp(phone);
                      }
                    },
                  ),
                  verticalSpace(24),
                  SectionTitle(title: context.localization.userAddress),
                  verticalSpace(16),
                  InfoWidget(
                    image: orderDetails.userOrderEntity?.image ?? '',
                    name: orderDetails.userOrderEntity?.firstName ?? '',
                    address: 'ahmed',
                    onCall: () {
                      final phone = orderDetails.userOrderEntity?.phone;
                      if (phone != null) {
                        viewModel.openCallKeypad(phone);
                      }
                    },
                    onWhatsApp: () {
                      final phone = orderDetails.userOrderEntity?.phone;
                      if (phone != null) {
                        viewModel.openWhatsApp(phone);
                      }
                    },
                  ),
                  verticalSpace(24),
                  SectionTitle(title: context.localization.orderDetails),
                  verticalSpace(16),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderDetails.orderItems?.length ?? 0,
                    itemBuilder: (context, index) {
                      final orderItem = orderDetails.orderItems?[index];
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
                    title: context.localization.totalPrice,
                    leading:
                        '${context.localization.egp} ${orderDetails.totalPrice ?? ''}',
                  ),
                  verticalSpace(24),
                  TextTypePriceWidget(
                    title: context.localization.paymentType,
                    leading: orderDetails.paymentType ?? '',
                  ),
                  verticalSpace(24),
                  ButtonOrderDetails(
                      updateState: viewModel.orderDetails.state == "Delivered"
                          ? null
                          : () => viewModel.updateState(orderDetails),
                      btnTxt: viewModel.btnTxt),
                  verticalSpace(100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
