class ProductReviewResponseModel {
  int? status;
  String? message;
  List<Data>? data;

  ProductReviewResponseModel({this.status, this.message, this.data});

  ProductReviewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? categoryId;
  String? productId;
  String? rating;
  String? image;
  String? title;
  String? description;
  String? delivery;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  String? reviewDateTime;

  Data(
      {this.id,
        this.categoryId,
        this.productId,
        this.rating,
        this.image,
        this.title,
        this.description,
        this.delivery,
        this.occasion,
        this.createdAt,
        this.updatedAt,
        this.reviewDateTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    productId = json['product_id'];
    rating = json['rating'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    delivery = json['delivery'];
    occasion = json['occasion'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviewDateTime = json['review_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['product_id'] = this.productId;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['delivery'] = this.delivery;
    data['occasion'] = this.occasion;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['review_date_time'] = this.reviewDateTime;
    return data;
  }
}
