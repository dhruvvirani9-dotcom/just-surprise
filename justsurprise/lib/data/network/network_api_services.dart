import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../utils/shared_preferences_services.dart';
import '../exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      String? token = await SharedPref.getToken();
      if (token == "" || token == null) {
        print("in if");
        final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
        responseJson = returnResponse(response);
      } else {
        print("in else $token");
        final response = await http.get(
            Uri.parse(url),
            headers : {'Accept': 'application/json','Authorization': 'Bearer $token'})
            .timeout(const Duration(seconds: 60));
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw InternetException("");
    } on RequestTimeout {
      throw RequestTimeout("");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      String? token = await SharedPref.getToken();
      if (token == "" || token == null) {
        print("in if");
        final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 60));
        responseJson = returnResponse(response);
      } else {
        print("in else$token");
        final response = await http.post(
            Uri.parse(url),
            body: data,
            headers : {'Accept': 'application/json','Content-Type': 'application/x-www-form-urlencoded','Authorization': 'Bearer $token'}
        )
            .timeout(const Duration(seconds: 60));
        print("in else$url");
        print("in else$response");

        responseJson = returnResponse(response);
      }
      print(responseJson);
    } on SocketException {
      print("in SocketException");
      throw InternetException("");
    } on RequestTimeout {
      print("in RequestTimeout");
      throw RequestTimeout("");
    }
    return responseJson;
  }

  Future<dynamic> postApiWithImage(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
      print(data["category_id"]);
    }

    dynamic responseJson;
    try {
      String? token = await SharedPref.getToken();
      var headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      };
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('image', data["image"]));
      request.fields.addAll({
        'category_id': data["category_id"],
        'product_id': data["product_id"],
        'rating': data["rating"],
        'title': data["title"],
        'description': data["description"],
        'delivery': data["delivery"],
        'occasion': data["occasion"]
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      responseJson = returnResponseWithImage(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeout {
      throw RequestTimeout("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    print("hello1${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        print("hello");
        print(response.body.toString());
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException("Error occurred while communicating with server${response.statusCode.toString()}");
    }
  }

  dynamic returnResponseWithImage(http.StreamedResponse response) async {
    print("hello2");
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(await response.stream.bytesToString());
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException("Error occurred while communicating with server${response.statusCode.toString()}");
    }
  }

}

// class pincodeListApi extends GetxController{
//   static Future<List<PincodeData>> getPincodeSuggestions(String query ,String pincode) async{
//     print("data");
//     final url = Uri.parse("https://thepurehearts.in/api/pincode");
//     Map data = {
//       "pincode" : pincode,
//     };
//
//     final response = await http.post(url, body: data);
//     print(response.statusCode);
//
//     if(response.statusCode == 200){
//       print(response.statusCode);
//       final List pincodeList = json.decode(response.body);
//       return pincodeList.map((json) =>PincodeData.fromJson(json)).where((pincode){
//         final nameLower = pincode.pincode?.toLowerCase();
//         final queryLower = query.toLowerCase();
//         return nameLower!.contains(queryLower);
//       }).toList();
//     }else{
//       throw InvalidUrlException();
//     }
//
//   }
// }
