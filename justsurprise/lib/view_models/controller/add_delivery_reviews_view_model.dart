class AddDeliveryReviewsViewModel {
  int? status;
  String? message;
  ReviewData? reviewData;

  AddDeliveryReviewsViewModel({this.status, this.message, this.reviewData});

  AddDeliveryReviewsViewModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? rating;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  ReviewData(
      {this.orderId,
        this.rating,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id});

  ReviewData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    rating = json['rating'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
