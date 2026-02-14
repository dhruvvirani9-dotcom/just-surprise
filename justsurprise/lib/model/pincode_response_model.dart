class PincodeResponseModel {
  int? status;
  String? message;
  List<PincodeData>? pincodeData;

  PincodeResponseModel({this.status, this.message, this.pincodeData});

  PincodeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['pincode_data'] != null) {
      pincodeData = <PincodeData>[];
      json['pincode_data'].forEach((v) {
        pincodeData!.add(new PincodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.pincodeData != null) {
      data['pincode_data'] = this.pincodeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PincodeData {
  int? id;
  String? officeName;
  String? pincode;
  String? district;
  String? stateName;

  PincodeData(
      {this.id, this.officeName, this.pincode, this.district, this.stateName});

  PincodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    officeName = json['office_name'];
    pincode = json['pincode'];
    district = json['district'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['office_name'] = this.officeName;
    data['pincode'] = this.pincode;
    data['district'] = this.district;
    data['state_name'] = this.stateName;
    return data;
  }
}
