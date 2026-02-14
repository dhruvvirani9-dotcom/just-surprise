class GiftTypeResponseModel {
  int? status;
  String? message;
  List<GiftTypeData>? giftTypeData;

  GiftTypeResponseModel({this.status, this.message, this.giftTypeData});

  GiftTypeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['gift_type_data'] != null) {
      giftTypeData = <GiftTypeData>[];
      json['gift_type_data'].forEach((v) {
        giftTypeData!.add(new GiftTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.giftTypeData != null) {
      data['gift_type_data'] =
          this.giftTypeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GiftTypeData {
  int? id;
  String? name;
  String? image;
  int? position;
  int? status;
  String? metaTitle;
  String? metaDescription;
  String? metaTags;
  String? slugUrl;
  String? canonicalLink;
  String? createdAt;
  String? updatedAt;

  GiftTypeData(
      {this.id,
        this.name,
        this.image,
        this.position,
        this.status,
        this.metaTitle,
        this.metaDescription,
        this.metaTags,
        this.slugUrl,
        this.canonicalLink,
        this.createdAt,
        this.updatedAt});

  GiftTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    position = json['position'];
    status = json['status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaTags = json['meta_tags'];
    slugUrl = json['slug_url'];
    canonicalLink = json['canonical_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['position'] = this.position;
    data['status'] = this.status;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_tags'] = this.metaTags;
    data['slug_url'] = this.slugUrl;
    data['canonical_link'] = this.canonicalLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
