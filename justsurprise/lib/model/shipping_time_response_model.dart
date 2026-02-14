class ShippingTimeDataResponseModel {
  int? status;
  String? message;
  List<ShippingTimeData>? shippingTimeData;

  ShippingTimeDataResponseModel(
      {this.status, this.message, this.shippingTimeData});

  ShippingTimeDataResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['shipping_time_data'] != null) {
      shippingTimeData = <ShippingTimeData>[];
      json['shipping_time_data'].forEach((v) {
        shippingTimeData!.add(new ShippingTimeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.shippingTimeData != null) {
      data['shipping_time_data'] =
          this.shippingTimeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingTimeData {
  int? id;
  String? shippingId;
  String? time;
  String? createdAt;
  String? updatedAt;

  ShippingTimeData(
      {this.id, this.shippingId, this.time, this.createdAt, this.updatedAt});

  ShippingTimeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingId = json['shipping_id'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shipping_id'] = this.shippingId;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
