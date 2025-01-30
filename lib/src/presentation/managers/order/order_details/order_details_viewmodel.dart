import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';
import 'package:tracking_app/src/domain/use_cases/order/order_details_usecase.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class OrderDetailsViewmodel extends Cubit<OrderDetailsState> {
  OrderDetailsUsecase _orderDetailsUsecase;
  OrderDetailsViewmodel(this._orderDetailsUsecase)
      : super(OrderDetailsLoading());

  void getOrderDetails() async {
    try {
      print('1');
      PendingOrderEntity orderDetails =
          await _orderDetailsUsecase.getOrderDetails();
      print('length of order ${orderDetails.orderItems?.length}');
      print('2');
      if (orderDetails.storeOrderEntity == null ||
          orderDetails.userOrderEntity == null) {
        print('3');
        throw Exception("Order details are incomplete");
      }
      print('4');
      emit(OrderDetailsLoaded(orderDetails));
      print('5');
    } catch (e) {
      print('Error fetching order details: $e');
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
}
