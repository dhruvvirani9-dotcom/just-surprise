import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/round_button.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/view_models/controller/sign_up_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    signUpVM.isConnected.value = await Utils.isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          color: AppColor.whiteColor,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        color: AppColor.magnoliaColor,
                        shape: BoxShape.circle
                    ), child: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
                const Center(child: Text("Sign Up", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 28.0, fontFamily: "Kanit"))),
                const SizedBox(height: 10.0),
                const Text("Username", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 15.0, fontFamily: "Inter")),
                TextField(
                  controller: signUpVM.userNameController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text("Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: signUpVM.passwordController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text("Confirm Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                Obx(() => TextField(
                  controller: signUpVM.confirmPasswordController.value,
                  obscureText: signUpVM.hidePassword.value,
                  obscuringCharacter: "*",
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      suffixIcon: IconButton(
                        icon: signUpVM.hidePassword.value ?
                        const Icon(Icons.visibility_off, color: AppColor.smokeyGrayColor, size: 15.0) :
                        const Icon(Icons.visibility, color: AppColor.smokeyGrayColor, size: 15.0),
                        onPressed: () {
                          signUpVM.hidePassword.value = !signUpVM.hidePassword.value;
                        },
                      )
                  ),
                )),
                const SizedBox(height: 15.0),
                const Text("Email Address", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: signUpVM.emailController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text("Mobile No.", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: signUpVM.mobileNumController.value,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 30.0),
                InkWell(
                  onTap: () {
                    _launchInBrowser(Uri.parse('https://www.google.com/'));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By connecting your account confirm that you agree with our ', style: TextStyle(color: AppColor.spanishGrayColor, fontFamily: "Inter", fontSize: 13.0),
                      children: [
                        TextSpan(text: 'Term and Condition', style: TextStyle(color: AppColor.eerieBlackColor, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Obx(() => RoundButton(
                    title: "SIGN UP",
                    width: Get.width * 0.4,
                    loading: signUpVM.loading.value,
                    onPress: () {
                      if(signUpVM.userNameController.value.text.isNotEmpty && signUpVM.passwordController.value.text.isNotEmpty && signUpVM.confirmPasswordController.value.text.isNotEmpty && signUpVM.emailController.value.text.isNotEmpty && signUpVM.mobileNumController.value.text.isNotEmpty) {
                        if (signUpVM.passwordController.value.text == signUpVM.confirmPasswordController.value.text) {
                          if (signUpVM.isConnected.value) {
                            signUpVM.signUpApi(context);
                          } else {
                            Utils.noInternetDialog(context);
                          }
                        } else {
                          Utils.flushBarErrorMessage("Password Not Matched", context);
                        }
                      } else {
                        if(signUpVM.userNameController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter UserName", context);
                        } else if(signUpVM.passwordController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Password", context);
                        } else if (signUpVM.confirmPasswordController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Confirm Password", context);
                        } else if (signUpVM.emailController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Your Email", context);
                        } else if (signUpVM.mobileNumController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Your Mobile Number", context);
                        }
                      }
                    },
                  )),
                ),
                const SizedBox(height: 10.0),
                const Center(child: Text("or log in with", style: TextStyle(color: AppColor.blackColor, fontSize: 12.0, fontFamily: "ProductSans"))),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () async {
                    final User? user = await _signInWithGoogle();
                    if (user != null) {
                      print('displayName ${user.displayName}');
                      print('email ${user.email}');
                      print('emailVerified ${user.emailVerified}');
                      print('photoURL ${user.photoURL}');
                      print('uid ${user.uid}');
                      // Navigate to the next screen after successful sign-in
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NextScreen()));
                    } else {
                      Utils.flushBarErrorMessage('Sign-in failed', context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.chineseWhiteColor, width: 1.0),
                        shape: BoxShape.circle
                    ), child: const Image(image: AssetImage(IconAssets.google), width: 20.0, height: 20.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? ", style: TextStyle(color: AppColor.blackColor, fontSize: 14.0, fontFamily: "ProductSans")),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.loginScreen);
                      }, child: const Text("Log in", style: TextStyle(color: AppColor.blackColor, fontSize: 14.0, fontFamily: "ProductSans"))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        return authResult.user;
      }
    } catch (error) {
      print("Google sign in error: $error");
      return null;
    }
    return null;
  }
}
