import 'package:injectable/injectable.dart';

import '../../../domain/repositories/order/order_repo.dart';
import '../../data_sources/online_data_source/order/order_online_data_source.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  final OrderOnlineDataSource _orderOnlineDataSource;
  OrderRepoImpl(this._orderOnlineDataSource);

  @override
  Future<void> putData() {
    return _orderOnlineDataSource.putData();
  }
}
