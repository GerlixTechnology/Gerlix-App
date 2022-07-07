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
import 'my_dashboard_controller.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({Key key}) : super(key: key);

  @override
  State<MyDashboardPage> createState() => _MyDashboardPageState();

}

class _MyDashboardPageState extends State<MyDashboardPage> with TickerProviderStateMixin{

  MyDashboardController _con = new MyDashboardController();




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

    return DefaultTabController(
      length: _con.categories?.length,
      child: Scaffold(
        key: _con.key,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170),
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
            bottom: TabBar(
              indicatorColor: MyColors.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: List<Widget>.generate(_con.categories.length, (index) {
                return Tab(
                  child: Text(_con.categories[index].name ?? ''),
                );
              }),
            ),
          ),
        ),
        drawer: _drawer(),
        body: TabBarView(
          children: _con.categories.map((Category category) {
            return GridView.count(
                crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: List.generate(10, (index) {
                return _cardProduct();
              }),

            );
          }).toList(),
        ),
        )
      );
  }

  Widget _cardProduct(){
    return Container(
      height: 250,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            Positioned(
                top: -1.0,
                right: -1.0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(20)
                    )
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(20),
                  child: FadeInImage(
                    image: AssetImage('assets/img/pizza2.png'),
                    fit: BoxFit.contain,
                      fadeInDuration: Duration(milliseconds: 50),
                    placeholder: AssetImage('assets/img/no-image.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 33,
                  child: Text(
                    'Nombre del producto',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NimbusSans'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top: 15),
                  height: 33,
                  child: Text(
                    'Nombre del proveedor',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NimbusSans'
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                      '0.0\$',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NimbusSans',
                      ),
                  ),
                )
              ],
            )
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





