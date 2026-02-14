class FaqResponseModel {
  int? status;
  String? message;
  List<FaqData>? faqData;

  FaqResponseModel({this.status, this.message, this.faqData});

  FaqResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['faq_data'] != null) {
      faqData = <FaqData>[];
      json['faq_data'].forEach((v) {
        faqData!.add(new FaqData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.faqData != null) {
      data['faq_data'] = this.faqData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaqData {
  String? topicName;
  int? id;
  int? topicId;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;

  FaqData(
      {this.topicName,
        this.id,
        this.topicId,
        this.question,
        this.answer,
        this.createdAt,
        this.updatedAt});

  FaqData.fromJson(Map<String, dynamic> json) {
    topicName = json['topic_name'];
    id = json['id'];
    topicId = json['topic_id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic_name'] = this.topicName;
    data['id'] = this.id;
    data['topic_id'] = this.topicId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
