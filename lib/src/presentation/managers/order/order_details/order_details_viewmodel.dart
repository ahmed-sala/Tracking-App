import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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
  String btnTxt = buttonsList[0];
  PendingOrderEntity orderDetails = PendingOrderEntity();
  void getOrderDetails() async {
    emit(GetOrderDetailsLoading());
    try {
      orderDetails = await _orderDetailsUsecase.getOrderDetails();

      emit(GetOrderDetailsLoaded(orderDetails));
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

      String nextState = stateList[counter + 1];
      await _orderDetailsUsecase.updateState(orderDetail.id, nextState);
      updateText(counter + 1);
      emit(UpdateStateLoaded()); // Emits a new state instance
    } catch (e, stackTrace) {
      emit(UpdateStateError(e.toString()));
    }
  }

  void updateText(int index) {
    if (counter == stateList.length) {
      counter = 0;
    }
    btnTxt = buttonsList[counter];
  }
}
