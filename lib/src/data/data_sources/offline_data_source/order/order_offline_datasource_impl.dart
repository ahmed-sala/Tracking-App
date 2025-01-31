import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/order/order_offline_datasource.dart';

@Injectable(as: OrderOfflineDatasource)
class OrderOfflineDatasourceImpl implements OrderOfflineDatasource {
  SharedPreferences sharedPreferences;
  OrderOfflineDatasourceImpl(this.sharedPreferences);
  @override
  Future<String> getOrderId() async {
    return sharedPreferences.getString("orderId") ?? "";
  }
}
