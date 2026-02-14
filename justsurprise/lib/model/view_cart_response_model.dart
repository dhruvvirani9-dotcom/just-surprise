class ViewCartResponseModel {
  int? status;
  String? message;
  List<CartViewData>? cartViewData;
  List<AddressData>? addressData;
  ExtraChargeData? extraChargeData;
  int? standardDelivery;
  int? expressdDelivery;
  int? fixedTimeDelivery;
  int? preMidnightDelivery;
  int? earliestDelivery;
  int? allProductPrice;
  int? totalPrice;

  ViewCartResponseModel(
      {this.status,
        this.message,
        this.cartViewData,
        this.addressData,
        this.extraChargeData,
        this.standardDelivery,
        this.expressdDelivery,
        this.fixedTimeDelivery,
        this.preMidnightDelivery,
        this.earliestDelivery,
        this.allProductPrice,
        this.totalPrice});

  ViewCartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['cart_view_data'] != null) {
      cartViewData = <CartViewData>[];
      json['cart_view_data'].forEach((v) {
        cartViewData!.add(new CartViewData.fromJson(v));
      });
    }
    if (json['address_data'] != null) {
      addressData = <AddressData>[];
      json['address_data'].forEach((v) {
        addressData!.add(new AddressData.fromJson(v));
      });
    }
    extraChargeData = json['extra_charge_data'] != null
        ? new ExtraChargeData.fromJson(json['extra_charge_data'])
        : null;
    standardDelivery = json['standard_delivery'];
    expressdDelivery = json['expressd_delivery'];
    fixedTimeDelivery = json['fixed_time_delivery'];
    preMidnightDelivery = json['pre_midnight_delivery'];
    earliestDelivery = json['earliest_delivery'];
    allProductPrice = json['all_product_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.cartViewData != null) {
      data['cart_view_data'] =
          this.cartViewData!.map((v) => v.toJson()).toList();
    }
    if (this.addressData != null) {
      data['address_data'] = this.addressData!.map((v) => v.toJson()).toList();
    }
    if (this.extraChargeData != null) {
      data['extra_charge_data'] = this.extraChargeData!.toJson();
    }
    data['standard_delivery'] = this.standardDelivery;
    data['expressd_delivery'] = this.expressdDelivery;
    data['fixed_time_delivery'] = this.fixedTimeDelivery;
    data['pre_midnight_delivery'] = this.preMidnightDelivery;
    data['earliest_delivery'] = this.earliestDelivery;
    data['all_product_price'] = this.allProductPrice;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class CartViewData {
  int? id;
  int? userId;
  Null? orderId;
  String? ipAddress;
  int? productId;
  String? title;
  String? indicator;
  int? quantity;
  String? price;
  Null? productVariantId;
  String? image;
  String? deliveryDateTime;
  String? deliverableZipcodes;
  String? shippingMethod;
  String? shippingPrice;
  String? shippingSlotTime;
  Null? message;
  String? itemStatus;
  String? createdAt;
  String? updatedAt;
  String? foodType;
  String? productName;
  String? productImage;

  CartViewData(
      {this.id,
        this.userId,
        this.orderId,
        this.ipAddress,
        this.productId,
        this.title,
        this.indicator,
        this.quantity,
        this.price,
        this.productVariantId,
        this.image,
        this.deliveryDateTime,
        this.deliverableZipcodes,
        this.shippingMethod,
        this.shippingPrice,
        this.shippingSlotTime,
        this.message,
        this.itemStatus,
        this.createdAt,
        this.updatedAt,
        this.foodType,
        this.productName,
        this.productImage});

  CartViewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    ipAddress = json['ip_address'];
    productId = json['product_id'];
    title = json['title'];
    indicator = json['indicator'];
    quantity = json['quantity'];
    price = json['price'];
    productVariantId = json['product_variant_id'];
    image = json['image'];
    deliveryDateTime = json['delivery_date_time'];
    deliverableZipcodes = json['deliverable_zipcodes'];
    shippingMethod = json['shipping_method'];
    shippingPrice = json['shipping_price'];
    shippingSlotTime = json['shipping_slot_time'];
    message = json['message'];
    itemStatus = json['item_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    foodType = json['food_type'];
    productName = json['product_name'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['ip_address'] = this.ipAddress;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['indicator'] = this.indicator;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['product_variant_id'] = this.productVariantId;
    data['image'] = this.image;
    data['delivery_date_time'] = this.deliveryDateTime;
    data['deliverable_zipcodes'] = this.deliverableZipcodes;
    data['shipping_method'] = this.shippingMethod;
    data['shipping_price'] = this.shippingPrice;
    data['shipping_slot_time'] = this.shippingSlotTime;
    data['message'] = this.message;
    data['item_status'] = this.itemStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['food_type'] = this.foodType;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
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
