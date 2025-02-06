import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/repositories/order/order_repository.dart';

@injectable
class RemoveOrderIdUseCase {
  final OrderRepository orderRepository;
  RemoveOrderIdUseCase({required this.orderRepository});

  Future<ApiResult<bool>> invoke({required String orderId}) async {
    return orderRepository.removeOrderId(orderId: orderId);
  }
}
