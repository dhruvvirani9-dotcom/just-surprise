class OccasionResponseModel {
  int? status;
  String? message;
  List<OccationData>? occationData;

  OccasionResponseModel({this.status, this.message, this.occationData});

  OccasionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['occation_data'] != null) {
      occationData = <OccationData>[];
      json['occation_data'].forEach((v) {
        occationData!.add(new OccationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.occationData != null) {
      data['occation_data'] =
          this.occationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OccationData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  OccationData({this.id, this.name, this.createdAt, this.updatedAt});

  OccationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
