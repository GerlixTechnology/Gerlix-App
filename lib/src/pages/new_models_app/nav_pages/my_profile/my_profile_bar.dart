import 'package:flutter/material.dart';
import 'package:flutter_app_gerlixservices/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/my_profile/body.dart';

import '../../widgets/text_style/app_gerlix_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColorDark,
        elevation: 0,
        title:
            Center(
              child: Text(
                  'GERLIX',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'GerlixFont',
                  ),),
            ),
      ),
      body: Body(),
    );
  }


}
