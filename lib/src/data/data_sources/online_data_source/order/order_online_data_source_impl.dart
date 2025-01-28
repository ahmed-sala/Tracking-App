import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/firestore/firestore_services.dart';
import 'package:tracking_app/src/data/api/api_services.dart';

import '../../../api/core/api_response_models/order/pending_orders_response_model.dart';
import 'order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl implements OrderOnlineDataSource {
  final FirestoreService _firestoreServices;
  final ApiServices _apiServices;
  OrderOnlineDataSourceImpl(this._apiServices, this._firestoreServices);
  @override
  Future<PendingOrdersResponseModel> getAllPendingOrders() async {
    return await _apiServices.getAllPendingOrders();
  }

  @override
  Future<void> storeOrder(
      PendingOrdersResponseModel pendingOrdersResponseModel) async {
    await _firestoreServices.addDocument(
        'accepted_order', pendingOrdersResponseModel.toJson());
  }
}
