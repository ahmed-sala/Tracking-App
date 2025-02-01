import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utilities/functions/button_list.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import '../../../../domain/use_cases/order/order_details_usecase.dart';

@injectable
class OrderDetailsViewmodel extends Cubit<OrderDetailsState> {
  final OrderDetailsUsecase _orderDetailsUsecase;
  OrderDetailsViewmodel(
    this._orderDetailsUsecase,
  ) : super(OrderDetailsInitial());

  int counter = 0;
  late String btnTxt;
  PendingOrderEntity orderDetails = PendingOrderEntity();
  void getOrderDetails() async {
    emit(GetOrderDetailsLoading());
    try {
      var result = await _orderDetailsUsecase.getOrderDetails();
      switch (result) {
        case Success<PendingOrderEntity>():
          orderDetails = result.data!;
          int currentState = stateList.indexOf(orderDetails.state.toString());

          if (currentState == -1) {
            throw Exception("Unexpected order state: ${orderDetails.state}");
          }

          btnTxt = buttonsList[currentState];
          emit(GetOrderDetailsLoaded(orderDetails));
        case Failures<PendingOrderEntity>():
          emit(UpdateStateError(result.exception));
      }
    } catch (e) {
      emit(GetOrderDetailsError(
          "Failed to load order details. Please try again."));
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
    emit(UpdateStateLoading());
    try {
      counter = stateList.indexOf(orderDetail.state.toString());

      if (stateList[counter] == "Delivered") {
        emit(UpdateStateLoaded());
        return;
      }

      String nextState = stateList[counter + 1];
      var result =
          await _orderDetailsUsecase.updateState(orderDetail.id, nextState);
      switch (result) {
        case Success<void>():
          // Update the button text
          updateText(counter + 1);
          emit(UpdateStateLoaded());
        case Failures<void>():
          emit(UpdateStateError(result.exception));
      }
    } catch (e, stackTrace) {
      emit(UpdateStateError(e as Exception));
    }
  }

  void updateText(int index) {
    if (index >= stateList.length) {
      counter = stateList.length - 1; // Prevent index out of range
    } else {
      counter = index;
    }

    // If the state is "Delivered", disable the button
    if (stateList[counter] == "Delivered") {
      btnTxt =
          "Delivered"; // You can also set it to an empty string or disabled state
    } else {
      btnTxt = buttonsList[counter];
    }
  }
}
