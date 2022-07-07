import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/home_page/home_bar_controller.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_gerlix_text.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_large_text.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_text.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_text_elegant.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/widgets/text_style/app_text_elegant_2.dart';
import 'package:flutter_app_gerlixservices/src/utils/colors.dart';

import '../../../../models/category.dart';
import '../../../../utils/my_colors.dart';

class HomeBarPage extends StatefulWidget {
  const HomeBarPage({Key key}) : super(key: key);

  @override
  State<HomeBarPage> createState() => _HomeBarPageState();

}

class _HomeBarPageState extends State<HomeBarPage> with TickerProviderStateMixin{

  HomeBarController _con = new HomeBarController();

  var imagesServices ={
    'legal_services.png':'LegalServices',
    'clean_services.png':'CleanServices',
    'air_services.png':'AirServices',
  };

  var imagesProducts ={
    'legal_services.png':'LegalServices',
    'clean_services.png':'CleanServices',
    'air_services.png':'AirServices',
  };

  var imagesEvents ={
    'legal_services.png':'LegalServices',
    'clean_services.png':'CleanServices',
    'air_services.png':'AirServices',
  };

  var images ={
    'balloning.png':'Balloning',
    'hiking.png':'Hiking',
    'kayaking.png':'Kayaking',
    'snorkling.png':'Snorkling'
  };


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return DefaultTabController(
      length: _con.categories?.length,
      child: Scaffold(
            key: _con.key,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                actions: [
                  Container(
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsets.symmetric(horizontal: 93),
                      child: AppGerlixText(text: 'GERLIX',)),
                  _shoppingBag(),
                ],
                flexibleSpace: Column(
                  children: [
                    SizedBox(height: 40,),
                    _menuDrawer(),
                    SizedBox(height: 20,),
                    _textFildSearch(),
                  ],
                ),
              ),
            ),
            drawer: _drawer(),
            body: ListView(
                children: [
                  // MENU TEXT
                  SizedBox(height: 30),
                  // SERVICES TEXT
                  Column( children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child:AppTextElegant(text: '¡Hola, ${_con.user?.name ?? ''}!')
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child:AppTextElegantTwo(text: '¿En que podemos ayudarte?'))
                  ],
                  ),
                  SizedBox(height: 20),
                  //TAB BAR
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                        tabs: [
                          Tab(text: 'Servicios'),
                          Tab(text: 'Productos'),
                          Tab(text: 'Eventos'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 150,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                margin: EdgeInsets.only(right: 15, top: 10),
                              //width: 200,
                              width: 150,
                              //height: 200,
                              height: 150,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                  image: DecorationImage(
                                  image: AssetImage(
                                      'assets/img/'+imagesServices.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover
                                  )
                                  ),
                                  );
                          },
                        ),
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                margin: EdgeInsets.only(right: 15, top: 10),
                                //width: 200,
                                width: 150,
                                //height: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/'+imagesServices.keys.elementAt(index)
                                        ),
                                        fit: BoxFit.cover
                                    )
                                ),
                              );
                          },
                        ),
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                margin: EdgeInsets.only(right: 15, top: 10),
                                //width: 200,
                                width: 150,
                                //height: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/'+imagesServices.keys.elementAt(index)
                                        ),
                                        fit: BoxFit.cover
                                    )
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextElegant(text: 'Productos', size: 22,),
                        AppText(text: 'Más', color: AppColors.textColor1)
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index ){
                      return Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 50),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                  'assets/img/'+images.keys.elementAt(index)
                                 ),
                                  fit: BoxFit.cover
                              )
                             ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),

                ],

            ),
          ),
    );
  }

  Widget _textFildSearch(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey[500]
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                color: Colors.grey[300]
          )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.grey[300]
            ),
          ),
          contentPadding: EdgeInsets.all(15)
        ),
      ),
    );
  }
  
  Widget _shoppingBag(){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15, top: 13),
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
        ),
        Positioned(
            right: 16,
            top: 15,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
        ))
      ],
    );
  }

  Widget _menuDrawer() {
    return GestureDetector(
              onTap: _con.operDrawer,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/img/menu.png', width: 20, height: 20),
                )
            );
        }

  Widget _drawer(){
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: MyColors.primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_con.user?.name ?? ''} ${_con.user?.lastname ?? ''}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'NunitoFont',
                        fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    _con.user?.email ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontFamily: 'NunitoFont',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    _con.user?.phone ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoFont',
                        fontStyle: FontStyle.italic
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: FadeInImage(
                      image: _con.user?.image != null
                          ? NetworkImage(_con.user?.image)
                          : AssetImage('assets/img/no-image.png'),
                      fit: BoxFit.contain,
                      fadeInDuration: Duration(milliseconds: 50),
                      placeholder: AssetImage('assets/img/no-image.png'),
                    ),
                  )
                ],
              )
          ),
          ListTile(
            onTap: _con.goToUpdatePage,
            title: Text('Editar perfil'),
            trailing: Icon(Icons.edit_outlined),
          ),
          ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined),
          ),
          _con.user != null ?
          _con.user.roles.length > 1 ?
          ListTile(
            onTap: _con.goToRoles,
            title: Text('Seleccionar rol'),
            trailing: Icon(Icons.person_outline),
          ) : Container() : Container(),
          ListTile(
            onTap: _con.logout,
            title: Text('Cerrar sesión'),
            trailing: Icon(Icons.power_settings_new),
          ),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }




}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({this.color, this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius:radius);
  }

}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({this.color, this.radius});

  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size.width/2 -radius/2, configuration.size.height-radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }


}

