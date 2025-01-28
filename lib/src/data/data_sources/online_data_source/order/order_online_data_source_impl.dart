import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';

import '../../../api/core/api_response_models/order/pending_orders_response_model.dart';
import 'order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl implements OrderOnlineDataSource {
  final ApiServices _apiServices;
  OrderOnlineDataSourceImpl(this._apiServices);
  @override
  Future<PendingOrdersResponseModel> getAllPendingOrders() async {
    return await _apiServices.getAllPendingOrders();
  }
}
