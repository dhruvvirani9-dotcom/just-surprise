class ShippingDataResponseModel {
  int? status;
  String? message;
  List<ShippingData>? shippingData;

  ShippingDataResponseModel({this.status, this.message, this.shippingData});

  ShippingDataResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['shipping_data'] != null) {
      shippingData = <ShippingData>[];
      json['shipping_data'].forEach((v) {
        shippingData!.add(new ShippingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.shippingData != null) {
      data['shipping_data'] =
          this.shippingData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingData {
  int? id;
  String? name;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;

  ShippingData(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt});

  ShippingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
