import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_gerlix_text.dart';
import 'package:flutter_app_gerlixservices/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class FavoritesBarPage extends StatefulWidget {
  const FavoritesBarPage({Key key}) : super(key: key);

  @override
  State<FavoritesBarPage> createState() => _FavoritesBarPageState();
}

class _FavoritesBarPageState extends State<FavoritesBarPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(child: Center(
              child:
              _lottieAnimation())), //ANIMATION LOTTIE
          Positioned(
            top: 100,
              child:
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 80),
                    child:
                      AppGerlixText(
                        text: 'Próximamente',
                        size: 30,))), //TEXT PRÓXIMAMENTE
        ],
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 150,
          bottom: MediaQuery.of(context).size.height * 0.17
      ),
      child: Lottie.asset(
          'assets/json/rocket-foguete.json',
          width: 1024,
          height: 1024,
          fit: BoxFit.fill
      ),
    );
  }

}
