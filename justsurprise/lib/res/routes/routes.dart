import 'package:get/get.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/view/fragments/cart.dart';
import 'package:justsurprise/view/fragments/orders.dart';
import 'package:justsurprise/view/screens/add_address_screen.dart';
import 'package:justsurprise/view/screens/add_to_cart_screen.dart';
import 'package:justsurprise/view/screens/address_screen.dart';
import 'package:justsurprise/view/screens/categories_screen.dart';
import 'package:justsurprise/view/screens/contact_screen.dart';
import 'package:justsurprise/view/screens/orders_detail_screen.dart';
import 'package:justsurprise/view/screens/faq_screen.dart';
import 'package:justsurprise/view/screens/filter_screen.dart';
import 'package:justsurprise/view/screens/forgot_password_screen.dart';
import 'package:justsurprise/view/screens/home_screen.dart';
import 'package:justsurprise/view/screens/login_screen.dart';
import 'package:justsurprise/view/screens/make_it_extra_special_screen.dart';
import 'package:justsurprise/view/screens/new_password_screen.dart';
import 'package:justsurprise/view/screens/on_boarding_screen.dart';
import 'package:justsurprise/view/screens/product_detail_screen.dart';
import 'package:justsurprise/view/screens/product_screen.dart';
import 'package:justsurprise/view/screens/profile_screen.dart';
import 'package:justsurprise/view/screens/sign_up_screen.dart';
import 'package:justsurprise/view/screens/thank_you_screen.dart';
import 'package:justsurprise/view/screens/web_view_screen.dart';



class AppRoutes {
  static appRoutes() => [
    GetPage(name: RoutesName.onBoardingScreen, page: () => const OnBoardingScreen()),
    GetPage(name: RoutesName.loginScreen, page: () => const LoginScreen()),
    GetPage(name: RoutesName.signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: RoutesName.forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: RoutesName.newPasswordScreen, page: () => const NewPasswordScreen()),
    GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen()),
    GetPage(name: RoutesName.categoriesScreen, page: () => const CategoriesScreen()),
    GetPage(name: RoutesName.profileScreen, page: () => const ProfileScreen()),
    GetPage(name: RoutesName.addressScreen, page: () => const AddressScreen()),
    GetPage(name: RoutesName.contactScreen, page: () => const ContactScreen()),
    GetPage(name: RoutesName.productDetailScreen, page: () => const ProductDetailScreen()),
    GetPage(name: RoutesName.productScreen, page: () => const ProductScreen()),
    GetPage(name: RoutesName.filterScreen, page: () => const FilterScreen()),
    GetPage(name: RoutesName.makeItExtraSpecialScreen, page: () => const MakeItExtraSpecialScreen()),
    GetPage(name: RoutesName.ordersDetailScreen, page: () => const OrdersDetailScreen()),
    GetPage(name: RoutesName.orderScreen, page: () => const OrdersFragment()),
    GetPage(name: RoutesName.faqScreen, page: () => const FaqScreen()),
    GetPage(name: RoutesName.addToCartScreen, page: () => const AddToCartScreen()),
    GetPage(name: RoutesName.webViewScreen, page: () => const WebViewScreen()),
    GetPage(name: RoutesName.addAddressScreen, page: () => const AddAddressScreen()),
    GetPage(name: RoutesName.cartFragmentScreen, page: () => CartFragment()),
    GetPage(name: RoutesName.thankYouScreen, page: () => thankYouScreen()),
  ];
}