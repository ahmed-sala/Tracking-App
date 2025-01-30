import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';
import 'package:tracking_app/src/domain/use_cases/order/order_details_usecase.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utilities/functions/button_list.dart';

@injectable
class OrderDetailsViewmodel extends Cubit<OrderDetailsState> {
  OrderDetailsUsecase _orderDetailsUsecase;
  OrderDetailsViewmodel(this._orderDetailsUsecase)
      : super(OrderDetailsLoading());
  int _counter = 0;
  get counter => _counter;
  late PendingOrderEntity _orderDetails;
  bool _colorButton = false;
  get colorButton => _colorButton;

  void getOrderDetails() async {
    try {
      _orderDetails = await _orderDetailsUsecase.getOrderDetails();
      if (_orderDetails.storeOrderEntity == null ||
          _orderDetails.userOrderEntity == null) {
        throw Exception("Order details are incomplete");
      }
      emit(OrderDetailsLoaded(_orderDetails));
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
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

  void updateState(String id, String state) async {
    try {
      _counter++;
      _counter = 0;
      if (_counter >= buttonsList.length) {
        _colorButton = true;
      }

      // Emit state update before calling API to update UI immediately
      emit(StateUpdated(buttonsList[_counter], _orderDetails));

      await _orderDetailsUsecase.updateState(id, state);

      // Fetch the latest order details after updating the state
      getOrderDetails();
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
    }
  }
}
