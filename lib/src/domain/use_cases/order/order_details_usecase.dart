import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

import '../../repositories/order/order_repository.dart';

@injectable
class OrderDetailsUsecase {
  final OrderRepository _orderRepository;

  OrderDetailsUsecase(this._orderRepository);

  Future<PendingOrderEntity> getOrderDetails() async {
    return await _orderRepository.getPendingOrderById();
  }

  Future<void> storeOrder() async {
    PendingOrderEntity orderEntity = PendingOrderEntity(
      storeOrderEntity: StoreOrderEntity(
        phoneNumber: 'phoneNumber',
        name: 'name',
        address: 'address',
        image: 'image',
      ),
      id: '123',
      isDelivered: false,
      isPaid: false,
      orderNumber: '123',
      paymentType: 'paymentType',
      state: 'state',
      totalPrice: 100,
      createdAt: 'createdAt',
      updatedAt: 'updatedAt',
      userOrderEntity: UserOrderEntity(
        id: '123',
        email: 'email',
        firstName: 'firstName',
        lastName: 'lastName',
        image: 'image',
        photo: 'photo',
        phone: 'phone',
      ),
      orderItems: [
        OrderItemsEntity(
          id: '123',
          price: 100,
          product: ProductEntity(
            id: '123',
            price: 100,
            quantity: 1,
            title: 'product',
            images: ['image'],
            imgCover: 'image',
            description: 'description',
            category: 'category',
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
            occasion: 'occasion',
            slug: 'slug',
            priceAfterDiscount: 100,
            discount: 0,
            sold: 0,
          ),
          quantity: 1,
        ),
      ],
    );
    await _orderRepository.storeOrder(orderEntity);
  }
}
