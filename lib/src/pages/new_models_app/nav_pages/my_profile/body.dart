import 'package:flutter/material.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/my_profile/profile_menu.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/my_profile/profile_pic.dart';
import 'package:flutter_app_gerlixservices/src/utils/my_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: 'assets/icons/User Icon.svg',
          text: 'Mi Cuenta',
          press: (){},
        ),
        ProfileMenu(
            icon: 'assets/icons/Bill Icon.svg',
            text: 'Mis Pedidos',
            press: (){}),
        ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            text: 'Atención al cliente',
            press: (){}),
        ProfileMenu(
          icon: 'assets/icons/Settings.svg',
          text: 'Configuración',
          press: (){}),
        ProfileMenu(
          icon: 'assets/icons/Log out.svg',
          text: 'Cerrar sesión',
          press: (){}),
      ],
    );
  }

}
