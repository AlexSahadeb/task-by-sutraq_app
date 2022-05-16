import 'package:get/get.dart';
import 'package:sutraq_app/views/forgetpassword.dart';
import 'package:sutraq_app/views/home_screen.dart';
import 'package:sutraq_app/views/signin_screen.dart';
import 'package:sutraq_app/views/signup_screen.dart';

const String signIn = "/signIn-screen";
const String signup = "/signup-screen";
const String forget = "/forget-screen";
const String home = "/home-screen";

// control our page route flow
List<GetPage> getpages = [
  GetPage(name: signIn, page: () => SigninScreen()),
  GetPage(name: signup, page: () => SignUpScreen()),
  GetPage(name: forget, page: () => ForgetPassword()),
  GetPage(name: home, page: () => HomeScreen()),
];
