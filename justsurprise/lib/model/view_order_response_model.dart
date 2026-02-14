class ViewOrderResponseModel {
  int? status;
  int? totalPage;
  String? currentPage;
  String? message;
  List<OrderData>? orderData;

  ViewOrderResponseModel(
      {this.status,
        this.totalPage,
        this.currentPage,
        this.message,
        this.orderData});

  ViewOrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    message = json['message'];
    if (json['order_data'] != null) {
      orderData = <OrderData>[];
      json['order_data'].forEach((v) {
        orderData!.add(new OrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    data['message'] = this.message;
    if (this.orderData != null) {
      data['order_data'] = this.orderData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  int? id;
  int? userId;
  String? orderId;
  String? cartId;
  String? addressId;
  String? productIds;
  String? totalAmount;
  int? discountPrice;
  String? occasion;
  String? senderName;
  String? senderEmail;
  String? senderMobile;
  String? senderCity;
  String? orderStatus;
  String? paymentStatus;
  String? paymentType;
  String? paymentId;
  String? deliveryBoyId;
  String? couponId;
  String? deliveryOtp;
  String? deliveryVideoLink;
  String? receiverName;
  String? createdAt;
  String? updatedAt;
  String? placeDate;
  List<ProductData>? productData;
  Address? address;

  OrderData(
      {this.id,
        this.userId,
        this.orderId,
        this.cartId,
        this.addressId,
        this.productIds,
        this.totalAmount,
        this.discountPrice,
        this.occasion,
        this.senderName,
        this.senderEmail,
        this.senderMobile,
        this.senderCity,
        this.orderStatus,
        this.paymentStatus,
        this.paymentType,
        this.paymentId,
        this.deliveryBoyId,
        this.couponId,
        this.deliveryOtp,
        this.deliveryVideoLink,
        this.receiverName,
        this.createdAt,
        this.updatedAt,
        this.placeDate,
        this.productData,
        this.address});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    cartId = json['cart_id'];
    addressId = json['address_id'];
    productIds = json['product_ids'];
    totalAmount = json['total_amount'];
    discountPrice = json['discount_price'];
    occasion = json['occasion'];
    senderName = json['sender_name'];
    senderEmail = json['sender_email'];
    senderMobile = json['sender_mobile'];
    senderCity = json['sender_city'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    paymentId = json['payment_id'];
    deliveryBoyId = json['delivery_boy_id'];
    couponId = json['coupon_id'];
    deliveryOtp = json['delivery_otp'];
    deliveryVideoLink = json['delivery_video_link'];
    receiverName = json['receiver_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    placeDate = json['place_date'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['cart_id'] = this.cartId;
    data['address_id'] = this.addressId;
    data['product_ids'] = this.productIds;
    data['total_amount'] = this.totalAmount;
    data['discount_price'] = this.discountPrice;
    data['occasion'] = this.occasion;
    data['sender_name'] = this.senderName;
    data['sender_email'] = this.senderEmail;
    data['sender_mobile'] = this.senderMobile;
    data['sender_city'] = this.senderCity;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['payment_id'] = this.paymentId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['coupon_id'] = this.couponId;
    data['delivery_otp'] = this.deliveryOtp;
    data['delivery_video_link'] = this.deliveryVideoLink;
    data['receiver_name'] = this.receiverName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['place_date'] = this.placeDate;
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class ProductData {
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

  ProductData(
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

  ProductData.fromJson(Map<String, dynamic> json) {
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

class Address {
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

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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
