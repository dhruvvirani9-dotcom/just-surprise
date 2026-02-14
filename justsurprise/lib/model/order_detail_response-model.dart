class OrderDetailResponseModel {
  int? status;
  String? message;
  OrderData? orderData;
  List<ProductData>? productData;
  AddressData? addressData;
  ExtraChargeData? extraChargeData;
  int? allProductPrice;
  int? totalPrice;

  OrderDetailResponseModel(
      {this.status,
        this.message,
        this.orderData,
        this.productData,
        this.addressData,
        this.extraChargeData,
        this.allProductPrice,
        this.totalPrice});

  OrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    orderData = json['order_data'] != null
        ? new OrderData.fromJson(json['order_data'])
        : null;
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
    addressData = json['address_data'] != null
        ? new AddressData.fromJson(json['address_data'])
        : null;
    extraChargeData = json['extra_charge_data'] != null
        ? new ExtraChargeData.fromJson(json['extra_charge_data'])
        : null;
    allProductPrice = json['all_product_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.orderData != null) {
      data['order_data'] = this.orderData!.toJson();
    }
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    if (this.addressData != null) {
      data['address_data'] = this.addressData!.toJson();
    }
    if (this.extraChargeData != null) {
      data['extra_charge_data'] = this.extraChargeData!.toJson();
    }
    data['all_product_price'] = this.allProductPrice;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class OrderData {
  int? id;
  int? userId;
  String? orderId;
  String? cartId;
  String? addressId;
  String? productIds;
  String? totalAmount;
  int? discountPrice;
  String? occasion;
  String? senderName;
  String? senderEmail;
  String? senderMobile;
  String? senderCity;
  String? orderStatus;
  String? paymentStatus;
  String? paymentType;
  String? paymentId;
  Null? deliveryBoyId;
  Null? couponId;
  Null? deliveryOtp;
  Null? deliveryVideoLink;
  Null? receiverName;
  String? createdAt;
  String? updatedAt;

  OrderData(
      {this.id,
        this.userId,
        this.orderId,
        this.cartId,
        this.addressId,
        this.productIds,
        this.totalAmount,
        this.discountPrice,
        this.occasion,
        this.senderName,
        this.senderEmail,
        this.senderMobile,
        this.senderCity,
        this.orderStatus,
        this.paymentStatus,
        this.paymentType,
        this.paymentId,
        this.deliveryBoyId,
        this.couponId,
        this.deliveryOtp,
        this.deliveryVideoLink,
        this.receiverName,
        this.createdAt,
        this.updatedAt});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    cartId = json['cart_id'];
    addressId = json['address_id'];
    productIds = json['product_ids'];
    totalAmount = json['total_amount'];
    discountPrice = json['discount_price'];
    occasion = json['occasion'];
    senderName = json['sender_name'];
    senderEmail = json['sender_email'];
    senderMobile = json['sender_mobile'];
    senderCity = json['sender_city'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    paymentId = json['payment_id'];
    deliveryBoyId = json['delivery_boy_id'];
    couponId = json['coupon_id'];
    deliveryOtp = json['delivery_otp'];
    deliveryVideoLink = json['delivery_video_link'];
    receiverName = json['receiver_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['cart_id'] = this.cartId;
    data['address_id'] = this.addressId;
    data['product_ids'] = this.productIds;
    data['total_amount'] = this.totalAmount;
    data['discount_price'] = this.discountPrice;
    data['occasion'] = this.occasion;
    data['sender_name'] = this.senderName;
    data['sender_email'] = this.senderEmail;
    data['sender_mobile'] = this.senderMobile;
    data['sender_city'] = this.senderCity;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['payment_id'] = this.paymentId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['coupon_id'] = this.couponId;
    data['delivery_otp'] = this.deliveryOtp;
    data['delivery_video_link'] = this.deliveryVideoLink;
    data['receiver_name'] = this.receiverName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductData {
  int? id;
  String? image;
  String? productName;
  String? price;
  String? indicator;
  int? categoryId;

  ProductData(
      {this.id,
        this.image,
        this.productName,
        this.price,
        this.indicator,
        this.categoryId});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    productName = json['product_name'];
    price = json['price'];
    indicator = json['indicator'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['indicator'] = this.indicator;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class AddressData {
  int? id;
  int? userId;
  String? type;
  String? name;
  String? mobile;
  String? alternateMobile;
  String? address;
  String? landmark;
  String? email;
  String? pincode;
  int? isDefault;
  String? createdAt;
  String? updatedAt;

  AddressData(
      {this.id,
        this.userId,
        this.type,
        this.name,
        this.mobile,
        this.alternateMobile,
        this.address,
        this.landmark,
        this.email,
        this.pincode,
        this.isDefault,
        this.createdAt,
        this.updatedAt});

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    name = json['name'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    address = json['address'];
    landmark = json['landmark'];
    email = json['email'];
    pincode = json['pincode'];
    isDefault = json['is_default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['alternate_mobile'] = this.alternateMobile;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['email'] = this.email;
    data['pincode'] = this.pincode;
    data['is_default'] = this.isDefault;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ExtraChargeData {
  int? shippingCharge;
  int? convenienceCharge;

  ExtraChargeData({this.shippingCharge, this.convenienceCharge});

  ExtraChargeData.fromJson(Map<String, dynamic> json) {
    shippingCharge = json['shipping_charge'];
    convenienceCharge = json['convenience_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_charge'] = this.shippingCharge;
    data['convenience_charge'] = this.convenienceCharge;
    return data;
  }
}
