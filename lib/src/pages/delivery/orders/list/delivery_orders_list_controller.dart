import 'package:flutter/material.dart';
import 'package:flutter_app_gerlixservices/src/utils/shared_pref.dart';

import '../../../../models/user.dart';

class DeliveryOrdersListController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function refresh;
  User user;


  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    refresh();
  }

  void logout() {
    _sharedPref.logout(context, user.id);
  }

  void operDrawer(){
    key.currentState.openDrawer();
  }

  void goToRoles() {
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }

}