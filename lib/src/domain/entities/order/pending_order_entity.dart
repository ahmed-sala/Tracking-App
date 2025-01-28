class PendingOrderEntity {
  final String? id;
  final UserOrderEntity? userOrderEntity;
  final List<OrderItemsEntity>? orderItems;
  final double? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final StoreOrderEntity? storeOrderEntity;

  PendingOrderEntity({
    this.id,
    this.userOrderEntity,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.storeOrderEntity,
  });
}

class OrderItemsEntity {
  final ProductEntity? product;
  final num? price;
  final num? quantity;
  final String? id;

  OrderItemsEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });
}

class ProductEntity {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final num? price;
  final num? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? sold;
  final int? discount;
  ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.sold,
    this.discount,
  });
}

class UserOrderEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? photo;
  final String? image;

  UserOrderEntity({
    this.id,
    this.image,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.photo
  });
}

class StoreOrderEntity {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  StoreOrderEntity({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });
}
