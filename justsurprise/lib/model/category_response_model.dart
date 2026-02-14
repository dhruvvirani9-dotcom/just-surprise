class CategoryResponseModel {
  int? status;
  String? message;
  int? totalPage;
  String? currentPage;
  List<CategoryViewAllData>? categoryViewAllData;

  CategoryResponseModel(
      {this.status,
        this.message,
        this.totalPage,
        this.currentPage,
        this.categoryViewAllData});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    if (json['category_view_all_data'] != null) {
      categoryViewAllData = <CategoryViewAllData>[];
      json['category_view_all_data'].forEach((v) {
        categoryViewAllData!.add(new CategoryViewAllData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    if (this.categoryViewAllData != null) {
      data['category_view_all_data'] = this.categoryViewAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryViewAllData {
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

  CategoryViewAllData(
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

  CategoryViewAllData.fromJson(Map<String, dynamic> json) {
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
