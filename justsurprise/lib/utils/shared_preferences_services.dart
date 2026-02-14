import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static setCookie(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("COOKIE", cookie);
  }

  static Future<String?> getCookie() async {
    final prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString("COOKIE");
    return cookie;
  }

  static setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("TOKEN", token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");
    return token;
  }

  static setUserid(String userid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userid", userid);
  }

  static Future<String?> getUserid() async {
    final prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("userid");
    return userid;
  }

  static setUserName(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    return username;
  }

  static setUserEmail(String useremail) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("useremail", useremail);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String? useremail = prefs.getString("useremail");
    return useremail;
  }

  static setUserNumber(String userenumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("usernumber", userenumber);
  }

  static Future<String?> getUserNumber() async {
    final prefs = await SharedPreferences.getInstance();
    String? usernumber = prefs.getString("usernumber");
    return usernumber;
  }

  static setUserDob(String useredob) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("useredob", useredob);
  }

  static Future<String?> getUserDob() async {
    final prefs = await SharedPreferences.getInstance();
    String? useredob = prefs.getString("useredob");
    print(useredob);
    return useredob;
  }

  static setUserAnniversaryDate(String Anniversary) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Anniversary", Anniversary);
  }

  static Future<String?> getUserAnniversaryDate() async {
    final prefs = await SharedPreferences.getInstance();
    String? Anniversary = prefs.getString("Anniversary");
    return Anniversary;
  }

  static setUserGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", gender);
  }

  static Future<String?> getUserGender() async {
    final prefs = await SharedPreferences.getInstance();
    String? gender = prefs.getString("gender");
    return gender;
  }

}