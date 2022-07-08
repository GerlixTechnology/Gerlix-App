
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_gerlixservices/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/favorites_pages/favorites_bar_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/home_page/home_bar_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/dashboard_page/my_dashboard_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/my_profile/my_profile_bar.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/shopping_cart/shopping_cart_bar.dart';
import 'package:flutter_app_gerlixservices/src/utils/my_colors.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key key}) : super(key: key);

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {

  ClientProductsListController _con = new ClientProductsListController();

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
    return Scaffold(
      backgroundColor: Colors.white,
      key: _con.key,
      drawer: _drawer(),
      body: pages[currentIndex],
      bottomNavigationBar: _buttonNavigationBar(),

    );
  }

  Widget _menuDrawer() {
    return GestureDetector(
      onTap: _con.operDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png', width: 20, height: 20),
      ),
    );
  }

  Widget _drawer() {
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
                        fontWeight: FontWeight.bold
                      ),
                    maxLines: 1,
                  ),
                  Text(
                    _con.user?.email ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
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


  Widget _buttonNavigationBar() {
    return Container(
      child:
      BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 5,
        items: [
          BottomNavigationBarItem(/*title:Text('Home'),*/icon: Icon(Icons.apps), label: 'Inicio'),
          BottomNavigationBarItem(/*title:Text('Favorites'),*/icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(/*title:Text('My Dashboard'),*/icon: Icon(Icons.public), label: 'Dashboard'),
          BottomNavigationBarItem(/*title:Text('Shopping cart'),*/icon: Icon(Icons.shopping_bag), label: 'Mi Carrito'),
          BottomNavigationBarItem(/*title:Text('My Profile'),*/icon: Icon(Icons.person), label: 'Mi Perfil'),
        ],
      ),
    );
  }

  List pages = [ // Icons Bottom Navigation Bar
    HomeBarPage(),
    MyDashboardPage(),
    FavoritesBarPage(),
    ShoppingCartBar(),
    ProfileScreen()
  ];


  int currentIndex=0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  void refresh() {
    setState(() {}); // CTRL + S
  }

}
