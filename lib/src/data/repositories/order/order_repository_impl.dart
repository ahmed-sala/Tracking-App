import 'package:injectable/injectable.dart';
import '../../../../core/common/apis/api_executer.dart';
import '../../../../core/common/apis/api_result.dart';
import '../../../domain/entities/order/pending_order_entity.dart';
import '../../../domain/repositories/order/order_repository.dart';
import '../../api/core/api_response_models/order/pending_orders_response_model.dart';
import '../../data_sources/online_data_source/order/order_online_data_source.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderOnlineDataSource _orderOnlineDataSource;
  OrderRepositoryImpl(this._orderOnlineDataSource);
  @override
  Future<ApiResult<List<PendingOrderEntity>>> getAllPendingOrders() async {
    return await executeApi<List<PendingOrderEntity>>(
      apiCall: () async {
        PendingOrdersResponseModel pendingOrders =
            await _orderOnlineDataSource.getAllPendingOrders();
        List<PendingOrderEntity> pendingOrder = pendingOrders.orders!
            .map(
              (e) => e.toDomain(),
            )
            .toList();
        return pendingOrder;
      },
    );
  }
}
