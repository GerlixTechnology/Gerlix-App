import 'package:flutter/material.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/my_profile/profile_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/my_colors.dart';

class ProfileMenu extends StatelessWidget {
   ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

   ProfileController _con = new ProfileController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: MyColors.primaryColor,
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                  text,
                style: Theme.of(context).textTheme.bodyText1
            ),
            ),
            Icon(Icons.arrow_forward_ios, color: MyColors.primaryColor,)
          ],
        ),
      ),
    );
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }

  void setState(Null Function() param0) {}

}
