class EditResponseModel {
  int? status;
  String? message;
  Data? data;

  EditResponseModel({this.status, this.message, this.data});

  EditResponseModel.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
