import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'package:flutter_app_gerlixservices/src/utils/shared_pref.dart';


class RolesController {

  BuildContext context;
  Function refresh;


  User user;
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;


    // OBTENER EL USUARIO DE SESIÓN.

    user = User.fromJson(await _sharedPref.read('user'));
    refresh();

  }

  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

}