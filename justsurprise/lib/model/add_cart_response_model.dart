class AddCartResponseModel {
  int? status;
  String? message;
  CartAddData? cartAddData;

  AddCartResponseModel({this.status, this.message, this.cartAddData});

  AddCartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    cartAddData = json['cart_add_data'] != null
        ? new CartAddData.fromJson(json['cart_add_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.cartAddData != null) {
      data['cart_add_data'] = this.cartAddData!.toJson();
    }
    return data;
  }
}

class CartAddData {
  int? userId;
  String? ipAddress;
  String? productId;
  String? title;
  String? quantity;
  String? price;
  Null? productVariantId;
  String? image;
  String? deliveryDateTime;
  Null? message;
  String? updatedAt;
  String? createdAt;
  int? id;

  CartAddData(
      {this.userId,
        this.ipAddress,
        this.productId,
        this.title,
        this.quantity,
        this.price,
        this.productVariantId,
        this.image,
        this.deliveryDateTime,
        this.message,
        this.updatedAt,
        this.createdAt,
        this.id});

  CartAddData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    ipAddress = json['ip_address'];
    productId = json['product_id'];
    title = json['title'];
    quantity = json['quantity'];
    price = json['price'];
    productVariantId = json['product_variant_id'];
    image = json['image'];
    deliveryDateTime = json['delivery_date_time'];
    message = json['message'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['ip_address'] = this.ipAddress;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['product_variant_id'] = this.productVariantId;
    data['image'] = this.image;
    data['delivery_date_time'] = this.deliveryDateTime;
    data['message'] = this.message;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
