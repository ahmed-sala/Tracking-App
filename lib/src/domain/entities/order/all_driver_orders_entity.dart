class AllDriverOrdersEntity {
  AllDriverOrdersEntity({
    List<OrdersEntity>? orders,
  }) {
    _orders = orders;
  }

  AllDriverOrdersEntity.fromJson(dynamic json) {
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(OrdersEntity.fromJson(v));
      });
    }
  }

  List<OrdersEntity>? _orders;

  List<OrdersEntity>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OrdersEntity {
  OrdersEntity({
    String? id,
    String? driver,
    OrderEntity? order,
    int? v,
    String? createdAt,
    String? updatedAt,
    StoreEntity? store,
  }) {
    _id = id;
    _driver = driver;
    _order = order;
    _v = v;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _store = store;
  }

  OrdersEntity.fromJson(dynamic json) {
    _id = json['_id'];
    _driver = json['driver'];
    _order = json['order'] != null ? OrderEntity.fromJson(json['order']) : null;
    _v = json['__v'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _store = json['store'] != null ? StoreEntity.fromJson(json['store']) : null;
  }
  String? _id;
  String? _driver;
  OrderEntity? _order;
  int? _v;
  String? _createdAt;
  String? _updatedAt;
  StoreEntity? _store;

  String? get id => _id;
  String? get driver => _driver;
  OrderEntity? get order => _order;
  int? get v => _v;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  StoreEntity? get store => _store;

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
}

class StoreEntity {
  StoreEntity({
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

  StoreEntity.fromJson(dynamic json) {
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
}

class OrderEntity {
  OrderEntity({
    String? id,
    UserEntity? user,
    List<OrderItemsEntity>? orderItems,
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

  OrderEntity.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? UserEntity.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      _orderItems = [];
      json['orderItems'].forEach((v) {
        _orderItems?.add(OrderItemsEntity.fromJson(v));
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
  UserEntity? _user;
  List<OrderItemsEntity>? _orderItems;
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
  UserEntity? get user => _user;
  List<OrderItemsEntity>? get orderItems => _orderItems;
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
}

class OrderItemsEntity {
  OrderItemsEntity({
    ProductEntity? product,
    int? price,
    int? quantity,
    String? id,
  }) {
    _product = product;
    _price = price;
    _quantity = quantity;
    _id = id;
  }

  OrderItemsEntity.fromJson(dynamic json) {
    _product = json['product'] != null
        ? ProductEntity.fromJson(json['product'])
        : null;
    _price = json['price'];
    _quantity = json['quantity'];
    _id = json['_id'];
  }
  ProductEntity? _product;
  int? _price;
  int? _quantity;
  String? _id;

  ProductEntity? get product => _product;
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
}

class ProductEntity {
  ProductEntity({
    String? id,
    int? price,
  }) {
    _id = id;
    _price = price;
  }

  ProductEntity.fromJson(dynamic json) {
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
}

class UserEntity {
  UserEntity({
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

  UserEntity.fromJson(dynamic json) {
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
}
