class ContactResponseModel {
  int? status;
  String? message;
  ContactData? contactData;

  ContactResponseModel({this.status, this.message, this.contactData});

  ContactResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    contactData = json['contact_data'] != null
        ? new ContactData.fromJson(json['contact_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.contactData != null) {
      data['contact_data'] = this.contactData!.toJson();
    }
    return data;
  }
}

class ContactData {
  int? id;
  String? image1;
  String? title1;
  String? description1;
  String? image2;
  String? title2;
  Null? description2;
  String? image3;
  String? title3;
  String? description3;
  String? image4;
  String? title4;
  String? description4;
  String? mainTitle;
  String? title5;
  String? title6;
  String? address;
  String? btnText;
  String? btnLink;
  String? createdAt;
  String? updatedAt;

  ContactData(
      {this.id,
        this.image1,
        this.title1,
        this.description1,
        this.image2,
        this.title2,
        this.description2,
        this.image3,
        this.title3,
        this.description3,
        this.image4,
        this.title4,
        this.description4,
        this.mainTitle,
        this.title5,
        this.title6,
        this.address,
        this.btnText,
        this.btnLink,
        this.createdAt,
        this.updatedAt});

  ContactData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image1 = json['image1'];
    title1 = json['title1'];
    description1 = json['description1'];
    image2 = json['image2'];
    title2 = json['title2'];
    description2 = json['description2'];
    image3 = json['image3'];
    title3 = json['title3'];
    description3 = json['description3'];
    image4 = json['image4'];
    title4 = json['title4'];
    description4 = json['description4'];
    mainTitle = json['main_title'];
    title5 = json['title5'];
    title6 = json['title6'];
    address = json['address'];
    btnText = json['btn_text'];
    btnLink = json['btn_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image1'] = this.image1;
    data['title1'] = this.title1;
    data['description1'] = this.description1;
    data['image2'] = this.image2;
    data['title2'] = this.title2;
    data['description2'] = this.description2;
    data['image3'] = this.image3;
    data['title3'] = this.title3;
    data['description3'] = this.description3;
    data['image4'] = this.image4;
    data['title4'] = this.title4;
    data['description4'] = this.description4;
    data['main_title'] = this.mainTitle;
    data['title5'] = this.title5;
    data['title6'] = this.title6;
    data['address'] = this.address;
    data['btn_text'] = this.btnText;
    data['btn_link'] = this.btnLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
