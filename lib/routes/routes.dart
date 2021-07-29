import 'package:account_app/bindings/add_person_binding.dart';
import 'package:account_app/bindings/auth_bindings.dart';
import 'package:account_app/bindings/database_binding.dart';
import 'package:account_app/pages/add_person/add_person_page.dart';
import 'package:account_app/pages/login/login_page.dart';
import 'package:account_app/pages/person/person_page.dart';
import 'package:account_app/pages/registration/registration_page.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class Routes {
  static const String HOMEROUTES = '/home';
  static const String LONIGROUTES = 'login';
  static const String REGISTRATIONROUTES = '/registration';
  static const String PERSONROUTES = '/person_page';
  static const String ADDPERSONROUTES = 'add_person_page';
  // static const String APPROUTES = 'app_page';
}

final routes = [
  GetPage(
    name: Routes.LONIGROUTES,
    page: () => const LoginPage(),
    binding: AuthBinding(),
    transition: Transition.leftToRightWithFade,
    curve: Curves.bounceInOut,
  ),
  GetPage(
    name: Routes.HOMEROUTES,
    page: () => const PersonPage(),
    binding: DataBaseBinding(),
    transition: Transition.leftToRightWithFade,
    curve: Curves.bounceInOut,
  ),
  GetPage(
    name: Routes.REGISTRATIONROUTES,
    page: () => const RegistrationPage(),
    binding: AuthBinding(),
    transition: Transition.leftToRightWithFade,
    curve: Curves.bounceInOut,
  ),
  GetPage(
    name: Routes.ADDPERSONROUTES,
    page: () => AddPersonPage(),
    binding: AddPersonBinding(),
    transition: Transition.leftToRightWithFade,
    curve: Curves.bounceInOut,
    
  ),
];
