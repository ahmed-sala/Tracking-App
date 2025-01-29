import '../../../data/api/core/api_response_models/order/pending_orders_response_model.dart';

class PendingOrderEntity {
  final String? id;
  final UserOrderEntity? userOrderEntity;
  final List<OrderItemsEntity>? orderItems;
  final int? totalPrice;
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
  PendingOrdersResponseModel toModel() {
    return PendingOrdersResponseModel(
      orders: [
        Orders(
          Id: id,
          user: userOrderEntity?.toModel(),
          orderItems: orderItems?.map((e) => e.toModel()).toList(),
          totalPrice: totalPrice,
          paymentType: paymentType,
          isPaid: isPaid,
          isDelivered: isDelivered,
          state: state,
          createdAt: createdAt,
          updatedAt: updatedAt,
          orderNumber: orderNumber,
          store: storeOrderEntity?.toModel(),
        )
      ],
    );
  }
}

class OrderItemsEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItemsEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });
  OrderItems toModel() {
    return OrderItems(
      product: product?.toModel(),
      price: price,
      quantity: quantity,
      Id: id,
    );
  }
}

class ProductEntity {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
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
  Product toModel() {
    return Product(
      Id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      sold: sold,
      discount: discount,
    );
  }
}

class UserOrderEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? photo;
  final String? image;

  UserOrderEntity(
      {this.id,
      this.image,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.photo});

  User toModel() {
    return User(
      Id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      photo: photo,
    );
  }
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

  Store toModel() {
    return Store(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}
