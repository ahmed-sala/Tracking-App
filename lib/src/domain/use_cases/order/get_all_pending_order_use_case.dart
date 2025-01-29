import 'package:injectable/injectable.dart';
import '../../../../core/common/apis/api_result.dart';
import '../../entities/order/pending_order_entity.dart';
import '../../repositories/order/order_repository.dart';

@injectable
class GetAllPendingOrderUseCase {
  final OrderRepository orderRepository;
  GetAllPendingOrderUseCase({required this.orderRepository});
  Future<ApiResult<List<PendingOrderEntity>>> invoke() async {
    return await orderRepository.getAllPendingOrders();
  }
}
