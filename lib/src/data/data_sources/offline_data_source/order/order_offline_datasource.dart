abstract interface class OrderOfflineDatasource {
  Future<String> getOrderId();
  Future<void> setOrderId({ String ? orderId});
}
