class AddAddressResponseModel {
  int? status;
  String? message;
  Data? data;

  AddAddressResponseModel({this.status, this.message, this.data});

  AddAddressResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? type;
  String? name;
  String? mobile;
  String? alternateMobile;
  String? address;
  String? landmark;
  String? email;
  String? pincode;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
        this.type,
        this.name,
        this.mobile,
        this.alternateMobile,
        this.address,
        this.landmark,
        this.email,
        this.pincode,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    name = json['name'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    address = json['address'];
    landmark = json['landmark'];
    email = json['email'];
    pincode = json['pincode'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['alternate_mobile'] = this.alternateMobile;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['email'] = this.email;
    data['pincode'] = this.pincode;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
