class AddProductReviewsViewModel {
  int? status;
  String? message;
  ReviewData? reviewData;

  AddProductReviewsViewModel({this.status, this.message, this.reviewData});

  AddProductReviewsViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    reviewData = json['review_data'] != null
        ? new ReviewData.fromJson(json['review_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.reviewData != null) {
      data['review_data'] = this.reviewData!.toJson();
    }
    return data;
  }
}

class ReviewData {
  String? categoryId;
  String? productId;
  String? rating;
  String? image;
  String? title;
  String? description;
  String? delivery;
  String? occasion;
  String? updatedAt;
  String? createdAt;
  int? id;

  ReviewData(
      {this.categoryId,
        this.productId,
        this.rating,
        this.image,
        this.title,
        this.description,
        this.delivery,
        this.occasion,
        this.updatedAt,
        this.createdAt,
        this.id});

  ReviewData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    productId = json['product_id'];
    rating = json['rating'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    delivery = json['delivery'];
    occasion = json['occasion'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['product_id'] = this.productId;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['delivery'] = this.delivery;
    data['occasion'] = this.occasion;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
