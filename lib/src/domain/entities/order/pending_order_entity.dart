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

  Orders toModel() {
    return Orders(
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
    );
  }

  PendingOrderEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userOrderEntity = json['userOrderEntity'],
        orderItems = json['orderItems'],
        totalPrice = json['totalPrice'],
        paymentType = json['paymentType'],
        isPaid = json['isPaid'],
        isDelivered = json['isDelivered'],
        state = json['state'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        orderNumber = json['orderNumber'],
        storeOrderEntity = json['storeOrderEntity'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userOrderEntity': userOrderEntity,
      'orderItems': orderItems,
      'totalPrice': totalPrice,
      'paymentType': paymentType,
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'state': state,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'orderNumber': orderNumber,
      'storeOrderEntity': storeOrderEntity,
    };
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

  OrderItemsEntity.fromJson(Map<String, dynamic> json)
      : product = json['product'],
        price = json['price'],
        quantity = json['quantity'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'price': price,
      'quantity': quantity,
      'id': id,
    };
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

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        slug = json['slug'],
        description = json['description'],
        imgCover = json['imgCover'],
        images = json['images'],
        price = json['price'],
        priceAfterDiscount = json['priceAfterDiscount'],
        quantity = json['quantity'],
        category = json['category'],
        occasion = json['occasion'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        sold = json['sold'],
        discount = json['discount'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'imgCover': imgCover,
      'images': images,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'quantity': quantity,
      'category': category,
      'occasion': occasion,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'sold': sold,
      'discount': discount,
    };
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

  UserOrderEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        phone = json['phone'],
        photo = json['photo'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'photo': photo,
      'image': image,
    };
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

  StoreOrderEntity.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        address = json['address'],
        phoneNumber = json['phoneNumber'],
        latLong = json['latLong'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'address': address,
      'phoneNumber': phoneNumber,
      'latLong': latLong,
    };
  }

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
