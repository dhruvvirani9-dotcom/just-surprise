class AddOrderResponseModel {
  int? status;
  String? message;
  Data? data;

  AddOrderResponseModel({this.status, this.message, this.data});

  AddOrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? orderId;
  int? userId;
  String? cartId;
  String? productIds;
  String? totalAmount;
  String? discountPrice;
  String? addressId;
  String? occasion;
  String? senderName;
  String? senderEmail;
  String? senderMobile;
  String? senderCity;
  String? orderStatus;
  String? paymentStatus;
  String? paymentType;
  int? id;

  Data(
      {this.orderId,
        this.userId,
        this.cartId,
        this.productIds,
        this.totalAmount,
        this.discountPrice,
        this.addressId,
        this.occasion,
        this.senderName,
        this.senderEmail,
        this.senderMobile,
        this.senderCity,
        this.orderStatus,
        this.paymentStatus,
        this.paymentType,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    cartId = json['cart_id'];
    productIds = json['product_ids'];
    totalAmount = json['total_amount'];
    discountPrice = json['discount_price'];
    addressId = json['address_id'];
    occasion = json['occasion'];
    senderName = json['sender_name'];
    senderEmail = json['sender_email'];
    senderMobile = json['sender_mobile'];
    senderCity = json['sender_city'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['product_ids'] = this.productIds;
    data['total_amount'] = this.totalAmount;
    data['discount_price'] = this.discountPrice;
    data['address_id'] = this.addressId;
    data['occasion'] = this.occasion;
    data['sender_name'] = this.senderName;
    data['sender_email'] = this.senderEmail;
    data['sender_mobile'] = this.senderMobile;
    data['sender_city'] = this.senderCity;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['id'] = this.id;
    return data;
  }
}
