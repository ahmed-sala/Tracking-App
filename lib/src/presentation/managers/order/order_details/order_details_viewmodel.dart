import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';
import 'package:tracking_app/src/domain/use_cases/order/order_details_usecase.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/functions/button_list.dart';

@injectable
class OrderDetailsViewmodel extends Cubit<OrderDetailsState> {
  OrderDetailsUsecase _orderDetailsUsecase;
  OrderDetailsViewmodel(this._orderDetailsUsecase)
      : super(OrderDetailsLoading());
  int _counter = 0;
  get counter => _counter;

  String? stateOrder;

  bool _colorButton = false;
  get colorButton => _colorButton;

  void getOrderDetails() async {
    try {
      emit(OrderDetailsLoading());
      PendingOrderEntity orderDetails =
          await _orderDetailsUsecase.getOrderDetails();
      print("order state from get is: ${orderDetails.state}");
      _counter = stateList.indexOf(orderDetails.state!);

      emit(OrderDetailsLoaded(orderDetails));
    } catch (e) {
      debugPrint("Error fetching order details: $e");
      emit(
          OrderDetailsError("Failed to load order details. Please try again."));
    }
  }

  void openCallKeypad(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void openWhatsApp(String phoneNumber) async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  void updateState(PendingOrderEntity orderDetail) async {
    try {
      emit(OrderDetailsLoading());

      String? currentState = orderDetail.state;
      _counter = stateList.indexOf(currentState!);

      if (_counter < stateList.length - 1) {
        String nextState = stateList[_counter + 1];

        print('Order id: ${orderDetail.id}');
        print('Order state before update: $currentState');
        print('Order state after update: $nextState');

        await _orderDetailsUsecase.updateState(orderDetail.id, nextState);

        PendingOrderEntity updatedNow =
            await _orderDetailsUsecase.getOrderDetails();
        print("State updated successfully");

        emit(StateUpdated(updatedNow)); // Emits a new state instance
      }
    } catch (e, stackTrace) {
      debugPrint("Error updating state: $e");
      debugPrint(stackTrace.toString());
      emit(OrderDetailsError(e.toString()));
    }
  }
}
