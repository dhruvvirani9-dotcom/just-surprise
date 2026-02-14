class JustSurpriseResponseModel {
  int? status;
  String? message;
  List<Categorydata>? categorydata;
  List<Bannerdata>? bannerdata;
  List<MostLoveGiftProducts>? mostLoveGiftProducts;
  List<GiftTrendsData>? giftTrendsData;
  List<Saledata>? saledata;
  List<FavFlowerData>? favFlowerData;
  List<BakeryData>? bakeryData;
  List<GiftTellStoryData>? giftTellStoryData;
  List<FilterDetail>? filterDetail;

  JustSurpriseResponseModel(
      {this.status,
        this.message,
        this.categorydata,
        this.bannerdata,
        this.mostLoveGiftProducts,
        this.giftTrendsData,
        this.saledata,
        this.favFlowerData,
        this.bakeryData,
        this.giftTellStoryData,
        this.filterDetail
  });

  JustSurpriseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categorydata'] != null) {
      categorydata = <Categorydata>[];
      json['categorydata'].forEach((v) {
        categorydata!.add(new Categorydata.fromJson(v));
      });
    }
    if (json['bannerdata'] != null) {
      bannerdata = <Bannerdata>[];
      json['bannerdata'].forEach((v) {
        bannerdata!.add(new Bannerdata.fromJson(v));
      });
    }
    if (json['most_love_gift_products'] != null) {
      mostLoveGiftProducts = <MostLoveGiftProducts>[];
      json['most_love_gift_products'].forEach((v) {
        mostLoveGiftProducts!.add(new MostLoveGiftProducts.fromJson(v));
      });
    }
    if (json['gift_trends_data'] != null) {
      giftTrendsData = <GiftTrendsData>[];
      json['gift_trends_data'].forEach((v) {
        giftTrendsData!.add(new GiftTrendsData.fromJson(v));
      });
    }
    if (json['saledata'] != null) {
      saledata = <Saledata>[];
      json['saledata'].forEach((v) {
        saledata!.add(new Saledata.fromJson(v));
      });
    }
    if (json['fav_flower_data'] != null) {
      favFlowerData = <FavFlowerData>[];
      json['fav_flower_data'].forEach((v) {
        favFlowerData!.add(new FavFlowerData.fromJson(v));
      });
    }
    if (json['bakery_data'] != null) {
      bakeryData = <BakeryData>[];
      json['bakery_data'].forEach((v) {
        bakeryData!.add(new BakeryData.fromJson(v));
      });
    }
    if (json['gift_tell_story_data'] != null) {
      giftTellStoryData = <GiftTellStoryData>[];
      json['gift_tell_story_data'].forEach((v) {
        giftTellStoryData!.add(new GiftTellStoryData.fromJson(v));
      });
    }
    if (json['filter_detail'] != null) {
      filterDetail = <FilterDetail>[];;
      json['filter_detail'].forEach((v) {
        filterDetail?.add(new FilterDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.categorydata != null) {
      data['categorydata'] = this.categorydata!.map((v) => v.toJson()).toList();
    }
    if (this.bannerdata != null) {
      data['bannerdata'] = this.bannerdata!.map((v) => v.toJson()).toList();
    }
    if (this.mostLoveGiftProducts != null) {
      data['most_love_gift_products'] =
          this.mostLoveGiftProducts!.map((v) => v.toJson()).toList();
    }
    if (this.giftTrendsData != null) {
      data['gift_trends_data'] =
          this.giftTrendsData!.map((v) => v.toJson()).toList();
    }
    if (this.saledata != null) {
      data['saledata'] = this.saledata!.map((v) => v.toJson()).toList();
    }
    if (this.favFlowerData != null) {
      data['fav_flower_data'] =
          this.favFlowerData!.map((v) => v.toJson()).toList();
    }
    if (this.bakeryData != null) {
      data['bakery_data'] = this.bakeryData!.map((v) => v.toJson()).toList();
    }
    if (this.giftTellStoryData != null) {
      data['gift_tell_story_data'] =
          this.giftTellStoryData!.map((v) => v.toJson()).toList();
    }
    if (filterDetail != null) {
      data['filter_detail'] = this.filterDetail!.map((v) => v.toJson()).toList();
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
class MaterialData {
  int? id;
  int? attributeId;
  int? filterable;
  String? value;
  int? status;
  String? createdAt;
  Null updatedAt;

  MaterialData(
      {this.id,
        this.attributeId,
        this.filterable,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  MaterialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    filterable = json['filterable'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['filterable'] = this.filterable;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ListData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? attributeId;
  int? filterable;
  String? value;
  int? status;
  bool? isChecked;

  setChecked(bool isChecked){
    this.isChecked = isChecked;
  }
  ListData({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt ,
    this.attributeId,
    this.filterable,
    this.value,
    this.isChecked,
    this.status,});

  ListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attributeId = json['attribute_id'];
    filterable = json['filterable'];
    value = json['value'];
    isChecked = json['isChecked'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['attribute_id'] = this.attributeId;
    data['filterable'] = this.filterable;
    data['value'] = this.value;
    data['isChecked'] = this.isChecked;
    data['status'] = this.status;
    return data;
  }
}

class PriceData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  PriceData({this.id, this.name, this.createdAt, this.updatedAt});

  PriceData.fromJson(Map<String, dynamic> json) {
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

class SizeData {
  int? id;
  int? attributeId;
  int? filterable;
  String? value;
  int? status;
  String? createdAt;
  Null updatedAt;

  SizeData(
      {this.id,
        this.attributeId,
        this.filterable,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  SizeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    filterable = json['filterable'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['filterable'] = this.filterable;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ColorData {
  int? id;
  int? attributeId;
  int? filterable;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  ColorData(
      {this.id,
        this.attributeId,
        this.filterable,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  ColorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    filterable = json['filterable'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['filterable'] = this.filterable;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FilterDetail {
  String? title;
  List<ListData>? list_data;

  FilterDetail(
      {this.title,
        this.list_data,
  });

  FilterDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];

    if (json['list_data'] != null) {
      list_data = <ListData>[];
      json['list_data'].forEach((v) {
        list_data?.add(new ListData.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (list_data != null) {
      data['list_data'] = this.list_data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class GiftTrendsData {
  int? id;
  String? productName;
  String? productType;
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
  String? brand;
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

  GiftTrendsData(
      {this.id,
        this.productName,
        this.productType,
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
        this.brand,
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

  GiftTrendsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
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
    brand = json['brand'];
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
    data['product_type'] = this.productType;
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
    data['brand'] = this.brand;
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

class Categorydata {
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

  Categorydata(
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

  Categorydata.fromJson(Map<String, dynamic> json) {
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

class Bannerdata {
  int? id;
  String? title;
  String? image;
  String? description;
  String? btnText;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  String? slugUrl;


  Bannerdata(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.btnText,
        this.categoryId,
        this.createdAt,
        this.slugUrl,
        this.updatedAt});

  Bannerdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    btnText = json['btn_text'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    slugUrl = json['slug_url'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['btn_text'] = this.btnText;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['slug_url'] = this.slugUrl;
    return data;
  }
}

class MostLoveGiftProducts {
  int? id;
  String? productName;
  String? productType;
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
  String? brand;
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

  MostLoveGiftProducts(
      {this.id,
        this.productName,
        this.productType,
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
        this.brand,
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

  MostLoveGiftProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
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
    brand = json['brand'];
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
    data['product_type'] = this.productType;
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
    data['brand'] = this.brand;
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

class Saledata {
  int? id;
  String? description;
  String? btnText;
  String? categorySlug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Saledata(
      {this.id,
        this.description,
        this.btnText,
        this.categorySlug,
        this.image,
        this.createdAt,
        this.updatedAt});

  Saledata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    btnText = json['btn_text'];
    categorySlug = json['category_slug'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['btn_text'] = this.btnText;
    data['category_slug'] = this.categorySlug;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FavFlowerData {
  int? id;
  String? productName;
  String? productType;
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
  String? brand;
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

  FavFlowerData(
      {this.id,
        this.productName,
        this.productType,
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
        this.brand,
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

  FavFlowerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
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
    brand = json['brand'];
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
    data['product_type'] = this.productType;
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
    data['brand'] = this.brand;
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

class BakeryData {
  int? id;
  String? productName;
  String? productType;
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
  String? brand;
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

  BakeryData(
      {this.id,
        this.productName,
        this.productType,
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
        this.brand,
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

  BakeryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
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
    brand = json['brand'];
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
    data['product_type'] = this.productType;
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
    data['brand'] = this.brand;
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

class GiftTellStoryData {
  int? id;
  String? productName;
  String? productType;
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
  String? brand;
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

  GiftTellStoryData(
      {this.id,
        this.productName,
        this.productType,
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
        this.brand,
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

  GiftTellStoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
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
    brand = json['brand'];
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
    data['product_type'] = this.productType;
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
    data['brand'] = this.brand;
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
