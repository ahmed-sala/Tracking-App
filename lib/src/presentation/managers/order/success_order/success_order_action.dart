
sealed class SuccessOrderAction {}
class RemoveOrderIdAction extends SuccessOrderAction{
  final String orderId;
  RemoveOrderIdAction({required this.orderId});
}