class userModel {
  int? status;
  String? message;
  String? token;
  User? user;

  userModel({this.status, this.message, this.token, this.user});

  userModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? dob;
  String? anniversary;
  String? gender;
  String? address;
  String? country;
  String? city;
  String? pincode;
  int? otp;
  String? otpVerifiedAt;
  String? emailVerifiedAt;
  String? emailVerifyCode;
  String? hashKey;
  String? hashExpiry;
  String? profilePicture;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.dob,
        this.anniversary,
        this.gender,
        this.address,
        this.country,
        this.city,
        this.pincode,
        this.otp,
        this.otpVerifiedAt,
        this.emailVerifiedAt,
        this.emailVerifyCode,
        this.hashKey,
        this.hashExpiry,
        this.profilePicture,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    dob = json['dob'];
    anniversary = json['anniversary'];
    gender = json['gender'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    pincode = json['pincode'];
    otp = json['otp'];
    otpVerifiedAt = json['otp_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    emailVerifyCode = json['email_verify_code'];
    hashKey = json['hash_key'];
    hashExpiry = json['hash_expiry'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['anniversary'] = this.anniversary;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['otp'] = this.otp;
    data['otp_verified_at'] = this.otpVerifiedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['email_verify_code'] = this.emailVerifyCode;
    data['hash_key'] = this.hashKey;
    data['hash_expiry'] = this.hashExpiry;
    data['profile_picture'] = this.profilePicture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
