import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/order/order_offline_datasource.dart';

import '../../../../core/common/apis/api_executer.dart';
import '../../../../core/common/apis/api_result.dart';
import '../../../domain/entities/order/pending_order_entity.dart';
import '../../../domain/repositories/order/order_repository.dart';
import '../../api/core/api_response_models/order/pending_orders_response_model.dart';
import '../../data_sources/online_data_source/order/order_online_data_source.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderOnlineDataSource _orderOnlineDataSource;
  final OrderOfflineDatasource _orderOfflineDatasource;
  OrderRepositoryImpl(
      this._orderOnlineDataSource, this._orderOfflineDatasource);
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

  @override
  Future<void> storeOrder(PendingOrderEntity pendingOrderEntity) async {
    try {
      final model = pendingOrderEntity.toModel();
      print('Storing order: $model');
      await _orderOnlineDataSource.storeOrder(model);
    } catch (e) {
      print('Error storing order: $e');
      throw Exception('Error storing order: $e');
    }
  }

  @override
  Future<PendingOrderEntity> getPendingOrderById() async {
    try {
      String id = await _orderOfflineDatasource.getOrderId();
      Orders pendingOrdersResponseModel =
          await _orderOnlineDataSource.getPendingOrderById('123');
      return pendingOrdersResponseModel.toDomain();
    } catch (e) {
      throw Exception("Failed to fetch pending order: $e");
    }
  }

  @override
  Future<void> updateState(String id, String state) async {
    String id = await _orderOfflineDatasource.getOrderId();
    try {
      await _orderOnlineDataSource.updateState('123', state);
    } catch (e) {
      throw Exception("Failed to update order state: $e");
    }
  }
}
