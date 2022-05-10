import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/pages/dish/dish_page.dart';
import 'package:deliveryproyect/src/ui/pages/forgot_password/forgort_page.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_page.dart';
import 'package:deliveryproyect/src/ui/pages/login/login_page.dart';
import 'package:deliveryproyect/src/ui/pages/my_cart/cart_page.dart';
import 'package:deliveryproyect/src/ui/pages/onboard/onboard_page.dart';
import 'package:deliveryproyect/src/ui/pages/register/register_page.dart';
import 'package:deliveryproyect/src/ui/pages/splash/splash_page.dart';
import 'package:deliveryproyect/src/ui/pages/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

abstract class Pages {
  // ignore: constant_identifier_names
  static const String INITIAL = Routes.SPASH;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => const OnboardPage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.FORGOTPASSWORD: (_) => const ForgotPasswordPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.DISH: (_) => const DishPage(),
    Routes.CART: (_) => const MyCartPage(),
    Routes.SPASH: (_) => const SpashPage(),
  };
}
