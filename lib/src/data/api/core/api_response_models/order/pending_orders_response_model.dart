import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/order/pending_order_entity.dart';

part 'pending_orders_response_model.g.dart';

@JsonSerializable()
class PendingOrdersResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "orders")
  final List<Orders>? orders;

  PendingOrdersResponseModel({
    this.message,
    this.metadata,
    this.orders,
  });

  factory PendingOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PendingOrdersResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PendingOrdersResponseModelToJson(this);
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
class Orders {
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
  String? state;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "store")
  final Store? store;

  Orders({
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
    this.store,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return _$OrdersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersToJson(this);
  }

  factory Orders.fromFire(Map<String, dynamic> json) {
    return Orders(
      Id: json['id'],
      user: User.fromJson(json['user']),
      orderItems: (json['orderItems'] as List)
          .map((e) => OrderItems.fromJson(e))
          .toList(),
      totalPrice: json['totalPrice'],
      paymentType: json['paymentType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      state: json['state'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      orderNumber: json['orderNumber'],
      store: Store.fromJson(json['store']),
    );
  }
  Map<String, dynamic> toJsonFire() {
    return {
      "id": Id,
      "user": user?.toJson(),
      "orderItems": orderItems?.map((e) => e.toJsonFire()).toList(),
      "totalPrice": totalPrice,
      "paymentType": paymentType,
      "isPaid": isPaid,
      "isDelivered": isDelivered,
      "state": state,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "orderNumber": orderNumber,
      "store": store?.toJson(),
    };
  }

  PendingOrderEntity toDomain() {
    return PendingOrderEntity(
      id: Id,
      userOrderEntity: user?.toDomain(),
      orderItems: orderItems?.map((e) => e.toDomain()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
      storeOrderEntity: store?._toDomain(),
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
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  User({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  UserOrderEntity toDomain() {
    return UserOrderEntity(
      id: Id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      photo: photo,
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

  Map<String, dynamic> toJsonFire() {
    return {
      "product": product?.toJson(),
      "price": price,
      "quantity": quantity,
    };
  }

  OrderItemsEntity toDomain() {
    return OrderItemsEntity(
      product: product?.toDomain(),
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
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "discount")
  final int? discount;

  Product({
    this.Id,
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  ProductEntity toDomain() {
    return ProductEntity(
      id: Id,
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

  StoreOrderEntity _toDomain() {
    return StoreOrderEntity(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}
