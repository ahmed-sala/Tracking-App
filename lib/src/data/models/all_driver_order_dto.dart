import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';

class AllDriverOrdersDto {
  AllDriverOrdersDto({
    List<OrdersDto>? orders,
  }) {
    _orders = orders;
  }

  AllDriverOrdersDto.fromJson(dynamic json) {
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(OrdersDto.fromJson(v));
      });
    }
  }

  List<OrdersDto>? _orders;

  List<OrdersDto>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  AllDriverOrdersEntity toDomain() {
    return AllDriverOrdersEntity(
      orders: orders?.map((e) => e.toDomain()).toList(),
    );
  }
}

class OrdersDto {
  OrdersDto({
    String? id,
    String? driver,
    OrderDto? order,
    int? v,
    String? createdAt,
    String? updatedAt,
    StoreDto? store,
  }) {
    _id = id;
    _driver = driver;
    _order = order;
    _v = v;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _store = store;
  }

  OrdersDto.fromJson(dynamic json) {
    _id = json['_id'];
    _driver = json['driver'];
    _order = json['order'] != null ? OrderDto.fromJson(json['order']) : null;
    _v = json['__v'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _store = json['store'] != null ? StoreDto.fromJson(json['store']) : null;
  }
  String? _id;
  String? _driver;
  OrderDto? _order;
  int? _v;
  String? _createdAt;
  String? _updatedAt;
  StoreDto? _store;

  String? get id => _id;
  String? get driver => _driver;
  OrderDto? get order => _order;
  int? get v => _v;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  StoreDto? get store => _store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['driver'] = _driver;
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    map['__v'] = _v;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_store != null) {
      map['store'] = _store?.toJson();
    }
    return map;
  }

  OrdersEntity toDomain() {
    return OrdersEntity(
      id: id,
      driver: driver,
      order: order?.toDomain(),
      v: v,
      createdAt: createdAt,
      updatedAt: updatedAt,
      store: store?.toDomain(),
    );
  }
}

class StoreDto {
  StoreDto({
    String? name,
    String? image,
    String? address,
    String? phoneNumber,
    String? latLong,
  }) {
    _name = name;
    _image = image;
    _address = address;
    _phoneNumber = phoneNumber;
    _latLong = latLong;
  }

  StoreDto.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _address = json['address'];
    _phoneNumber = json['phoneNumber'];
    _latLong = json['latLong'];
  }
  String? _name;
  String? _image;
  String? _address;
  String? _phoneNumber;
  String? _latLong;

  String? get name => _name;
  String? get image => _image;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  String? get latLong => _latLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    map['address'] = _address;
    map['phoneNumber'] = _phoneNumber;
    map['latLong'] = _latLong;
    return map;
  }

  StoreEntity toDomain() {
    return StoreEntity(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}

class OrderDto {
  OrderDto({
    String? id,
    UserDto? user,
    List<OrderItemsDto>? orderItems,
    int? totalPrice,
    String? paymentType,
    bool? isPaid,
    bool? isDelivered,
    String? state,
    String? createdAt,
    String? updatedAt,
    String? orderNumber,
    int? v,
  }) {
    _id = id;
    _user = user;
    _orderItems = orderItems;
    _totalPrice = totalPrice;
    _paymentType = paymentType;
    _isPaid = isPaid;
    _isDelivered = isDelivered;
    _state = state;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderNumber = orderNumber;
    _v = v;
  }

  OrderDto.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      _orderItems = [];
      json['orderItems'].forEach((v) {
        _orderItems?.add(OrderItemsDto.fromJson(v));
      });
    }
    _totalPrice = json['totalPrice'];
    _paymentType = json['paymentType'];
    _isPaid = json['isPaid'];
    _isDelivered = json['isDelivered'];
    _state = json['state'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _orderNumber = json['orderNumber'];
    _v = json['__v'];
  }
  String? _id;
  UserDto? _user;
  List<OrderItemsDto>? _orderItems;
  int? _totalPrice;
  String? _paymentType;
  bool? _isPaid;
  bool? _isDelivered;
  String? _state;
  String? _createdAt;
  String? _updatedAt;
  String? _orderNumber;
  int? _v;

  String? get id => _id;
  UserDto? get user => _user;
  List<OrderItemsDto>? get orderItems => _orderItems;
  int? get totalPrice => _totalPrice;
  String? get paymentType => _paymentType;
  bool? get isPaid => _isPaid;
  bool? get isDelivered => _isDelivered;
  String? get state => _state;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get orderNumber => _orderNumber;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_orderItems != null) {
      map['orderItems'] = _orderItems?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = _totalPrice;
    map['paymentType'] = _paymentType;
    map['isPaid'] = _isPaid;
    map['isDelivered'] = _isDelivered;
    map['state'] = _state;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['orderNumber'] = _orderNumber;
    map['__v'] = _v;
    return map;
  }

  OrderEntity toDomain() {
    return OrderEntity(
      id: id,
      user: user?.toDomain(),
      orderItems: orderItems?.map((e) => e.toDomain()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
      v: v,
    );
  }
}

class OrderItemsDto {
  OrderItemsDto({
    ProductDto? product,
    int? price,
    int? quantity,
    String? id,
  }) {
    _product = product;
    _price = price;
    _quantity = quantity;
    _id = id;
  }

  OrderItemsDto.fromJson(dynamic json) {
    _product =
        json['product'] != null ? ProductDto.fromJson(json['product']) : null;
    _price = json['price'];
    _quantity = json['quantity'];
    _id = json['_id'];
  }
  ProductDto? _product;
  int? _price;
  int? _quantity;
  String? _id;

  ProductDto? get product => _product;
  int? get price => _price;
  int? get quantity => _quantity;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['_id'] = _id;
    return map;
  }

  OrderItemsEntity toDomain() {
    return OrderItemsEntity(
      product: product?.toDomain(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}

class ProductDto {
  ProductDto({
    String? id,
    int? price,
  }) {
    _id = id;
    _price = price;
  }

  ProductDto.fromJson(dynamic json) {
    _id = json['_id'];
    _price = json['price'];
  }
  String? _id;
  int? _price;

  String? get id => _id;
  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['price'] = _price;
    return map;
  }

  ProductEntity toDomain() {
    return ProductEntity(
      id: id,
      price: price,
    );
  }
}

class UserDto {
  UserDto({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? phone,
    String? photo,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _gender = gender;
    _phone = phone;
    _photo = photo;
  }

  UserDto.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _gender = json['gender'];
    _phone = json['phone'];
    _photo = json['photo'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _gender;
  String? _phone;
  String? _photo;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['photo'] = _photo;
    return map;
  }

  UserEntity toDomain() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photo: photo,
      phone: phone,
    );
  }
}
