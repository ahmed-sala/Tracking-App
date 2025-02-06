import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/data/models/all_driver_order_dto.dart';

part 'all_driver_oder_response.g.dart';

@JsonSerializable()
class AllDriverOderResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "orders")
  final List<OrdersResponse>? orders;

  AllDriverOderResponse({
    this.message,
    this.metadata,
    this.orders,
  });

  factory AllDriverOderResponse.fromJson(Map<String, dynamic> json) {
    return _$AllDriverOderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllDriverOderResponseToJson(this);
  }

  AllDriverOrdersDto toDto() {
    return AllDriverOrdersDto(
      orders: orders?.map((e) => e.toDto()).toList(),
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalItems")
  final int? totalItems;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class OrdersResponse {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "driver")
  final String? driver;
  @JsonKey(name: "order")
  final Order? order;
  @JsonKey(name: "__v")
  final int? V;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "store")
  final Store? store;

  OrdersResponse({
    this.Id,
    this.driver,
    this.order,
    this.V,
    this.createdAt,
    this.updatedAt,
    this.store,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return _$OrdersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersResponseToJson(this);
  }

  OrdersDto toDto() {
    return OrdersDto(
      id: Id,
      driver: driver,
      order: order?.toDto(),
      v: V,
      createdAt: createdAt,
      updatedAt: updatedAt,
      store: store?.toDto(),
    );
  }
}

@JsonSerializable()
class Order {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "orderItems")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? V;

  Order({
    this.Id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.V,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderToJson(this);
  }

  OrderDto toDto() {
    return OrderDto(
      id: Id,
      user: user?.toDto(),
      orderItems: orderItems?.map((e) => e.toDto()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
      v: V,
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;

  User({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  UserDto toDto() {
    return UserDto(
      id: Id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photo: photo,
      phone: phone,
    );
  }
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  OrderItems({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }

  OrderItemsDto toDto() {
    return OrderItemsDto(
      product: product?.toDto(),
      price: price,
      quantity: quantity,
      id: Id,
    );
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "price")
  final int? price;

  Product({
    this.Id,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  ProductDto toDto() {
    return ProductDto(
      id: Id,
      price: price,
    );
  }
}

@JsonSerializable()
class Store {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "latLong")
  final String? latLong;

  Store({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreToJson(this);
  }

  StoreDto toDto() {
    return StoreDto(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}
