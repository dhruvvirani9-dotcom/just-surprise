import '../../model/just_surprise_response_model.dart';

class getAllSaleProductResponseModel {
  int? status;
  int? totalPage;
  String? currentPage;
  String? message;
  List<GetAllSaleProductData>? productData;
  List<FilterDetail>? filterDetail;

  getAllSaleProductResponseModel(
      {this.status,
        this.totalPage,
        this.currentPage,
        this.message,
        this.productData,
        this.filterDetail});

  getAllSaleProductResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    message = json['message'];
    if (json['product_data'] != null) {
      productData = <GetAllSaleProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new GetAllSaleProductData.fromJson(v));
      });
    }
    if (json['filter_detail'] != null) {
      filterDetail = <FilterDetail>[];
      json['filter_detail'].forEach((v) {
        filterDetail!.add(new FilterDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    data['message'] = this.message;
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    if (this.filterDetail != null) {
      data['filter_detail'] =
          this.filterDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllSaleProductData {
  int? id;
  String? productName;
  String? slug;
  String? image;
  String? otherImages;
  String? price;
  String? mrp;
  String? tax;
  String? stockType;
  String? shortDescription;
  String? occationId;
  String? description;
  String? indicator;
  String? codAllowed;
  String? minimumOrderQuantity;
  String? totalAllowedQuantity;
  String? quantityStepSize;
  String? isPricesInclusiveTax;
  String? isReturnable;
  String? isCancelable;
  String? cancelableTill;
  String? isAttachmentRequired;
  String? videoType;
  String? video;
  String? tags;
  String? warrantyPeriod;
  String? guaranteePeriod;
  String? madeIn;
  String? brandId;
  String? sku;
  String? stock;
  String? availability;
  String? rating;
  String? noOfRatings;
  String? deliverableZipcodes;
  String? shippingMethod;
  String? pickupLocation;
  String? status;
  String? isOnSale;
  String? saleDiscount;
  String? saleStartDate;
  String? saleEndDate;
  String? isSameDayDelivery;
  String? productAttribute;
  String? tatTime;
  String? isAddon;
  String? metaTitle;
  String? slugUrl;
  String? showOnMainList;
  String? canonicalLink;
  String? metaDescription;
  String? createdAt;
  String? updatedAt;

  GetAllSaleProductData(
      {this.id,
        this.productName,
        this.slug,
        this.image,
        this.otherImages,
        this.price,
        this.mrp,
        this.tax,
        this.stockType,
        this.shortDescription,
        this.occationId,
        this.description,
        this.indicator,
        this.codAllowed,
        this.minimumOrderQuantity,
        this.totalAllowedQuantity,
        this.quantityStepSize,
        this.isPricesInclusiveTax,
        this.isReturnable,
        this.isCancelable,
        this.cancelableTill,
        this.isAttachmentRequired,
        this.videoType,
        this.video,
        this.tags,
        this.warrantyPeriod,
        this.guaranteePeriod,
        this.madeIn,
        this.brandId,
        this.sku,
        this.stock,
        this.availability,
        this.rating,
        this.noOfRatings,
        this.deliverableZipcodes,
        this.shippingMethod,
        this.pickupLocation,
        this.status,
        this.isOnSale,
        this.saleDiscount,
        this.saleStartDate,
        this.saleEndDate,
        this.isSameDayDelivery,
        this.productAttribute,
        this.tatTime,
        this.isAddon,
        this.metaTitle,
        this.slugUrl,
        this.showOnMainList,
        this.canonicalLink,
        this.metaDescription,
        this.createdAt,
        this.updatedAt});

  GetAllSaleProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    slug = json['slug'];
    image = json['image'];
    otherImages = json['other_images'];
    price = json['price'];
    mrp = json['mrp'];
    tax = json['tax'];
    stockType = json['stock_type'];
    shortDescription = json['short_description'];
    occationId = json['occation_id'];
    description = json['description'];
    indicator = json['indicator'];
    codAllowed = json['cod_allowed'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    totalAllowedQuantity = json['total_allowed_quantity'];
    quantityStepSize = json['quantity_step_size'];
    isPricesInclusiveTax = json['is_prices_inclusive_tax'];
    isReturnable = json['is_returnable'];
    isCancelable = json['is_cancelable'];
    cancelableTill = json['cancelable_till'];
    isAttachmentRequired = json['is_attachment_required'];
    videoType = json['video_type'];
    video = json['video'];
    tags = json['tags'];
    warrantyPeriod = json['warranty_period'];
    guaranteePeriod = json['guarantee_period'];
    madeIn = json['made_in'];
    brandId = json['brand_id'];
    sku = json['sku'];
    stock = json['stock'];
    availability = json['availability'];
    rating = json['rating'];
    noOfRatings = json['no_of_ratings'];
    deliverableZipcodes = json['deliverable_zipcodes'];
    shippingMethod = json['shipping_method'];
    pickupLocation = json['pickup_location'];
    status = json['status'];
    isOnSale = json['is_on_sale'];
    saleDiscount = json['sale_discount'];
    saleStartDate = json['sale_start_date'];
    saleEndDate = json['sale_end_date'];
    isSameDayDelivery = json['is_same_day_delivery'];
    productAttribute = json['product_attribute'];
    tatTime = json['tat_time'];
    isAddon = json['is_addon'];
    metaTitle = json['meta_title'];
    slugUrl = json['slug_url'];
    showOnMainList = json['show_on_main_list'];
    canonicalLink = json['canonical_link'];
    metaDescription = json['meta_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['other_images'] = this.otherImages;
    data['price'] = this.price;
    data['mrp'] = this.mrp;
    data['tax'] = this.tax;
    data['stock_type'] = this.stockType;
    data['short_description'] = this.shortDescription;
    data['occation_id'] = this.occationId;
    data['description'] = this.description;
    data['indicator'] = this.indicator;
    data['cod_allowed'] = this.codAllowed;
    data['minimum_order_quantity'] = this.minimumOrderQuantity;
    data['total_allowed_quantity'] = this.totalAllowedQuantity;
    data['quantity_step_size'] = this.quantityStepSize;
    data['is_prices_inclusive_tax'] = this.isPricesInclusiveTax;
    data['is_returnable'] = this.isReturnable;
    data['is_cancelable'] = this.isCancelable;
    data['cancelable_till'] = this.cancelableTill;
    data['is_attachment_required'] = this.isAttachmentRequired;
    data['video_type'] = this.videoType;
    data['video'] = this.video;
    data['tags'] = this.tags;
    data['warranty_period'] = this.warrantyPeriod;
    data['guarantee_period'] = this.guaranteePeriod;
    data['made_in'] = this.madeIn;
    data['brand_id'] = this.brandId;
    data['sku'] = this.sku;
    data['stock'] = this.stock;
    data['availability'] = this.availability;
    data['rating'] = this.rating;
    data['no_of_ratings'] = this.noOfRatings;
    data['deliverable_zipcodes'] = this.deliverableZipcodes;
    data['shipping_method'] = this.shippingMethod;
    data['pickup_location'] = this.pickupLocation;
    data['status'] = this.status;
    data['is_on_sale'] = this.isOnSale;
    data['sale_discount'] = this.saleDiscount;
    data['sale_start_date'] = this.saleStartDate;
    data['sale_end_date'] = this.saleEndDate;
    data['is_same_day_delivery'] = this.isSameDayDelivery;
    data['product_attribute'] = this.productAttribute;
    data['tat_time'] = this.tatTime;
    data['is_addon'] = this.isAddon;
    data['meta_title'] = this.metaTitle;
    data['slug_url'] = this.slugUrl;
    data['show_on_main_list'] = this.showOnMainList;
    data['canonical_link'] = this.canonicalLink;
    data['meta_description'] = this.metaDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FilterDetail {
  String? title;
  List<ListData>? list_data;

  FilterDetail({this.title, this.list_data});

  FilterDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['list_data'] != null) {
      list_data = <ListData>[];
      json['list_data'].forEach((v) {
        list_data!.add(new ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.list_data != null) {
      data['list_data'] = this.list_data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
