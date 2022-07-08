import 'package:flutter/material.dart';
import 'package:flutter_app_gerlixservices/src/pages/client/products/list/client_products_list_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/client/update/client_update_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/login/login_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/dashboard_page/my_dashboard_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/nav_pages/home_page/home_bar_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/new_models_app/welcome_view/welcome_page_beta.dart';
import 'package:flutter_app_gerlixservices/src/pages/register/register_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/restaurant_supplier/categories/create/restaurant_categories_create_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/restaurant_supplier/orders/list/restaurant_orders_list_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/restaurant_supplier/products/create/restaurant_products_create_page.dart';
import 'package:flutter_app_gerlixservices/src/pages/roles/roles_page.dart';
import 'package:flutter_app_gerlixservices/src/utils/my_colors.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      //initialRoute: 'welcome/pages',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
        'welcome/pages' : (BuildContext context) => WelcomePage(),
        'roles' : (BuildContext context) => RolesPage(),
        'client/products/list' : (BuildContext context) => ClientProductsListPage(),
        'client/update' : (BuildContext context) => ClientUpdatePage(),
        'supplier/orders/list' : (BuildContext context) => RestaurantSupplierOrdersListPage(),
        'supplier/categories/create' : (BuildContext context) => RestaurantCategoriesCreatePage(),
        'supplier/products/create' : (BuildContext context) => RestaurantProductsCreatePage(),
        'delivery/orders/list' : (BuildContext context) => DeliveryOrdersListPage(),
        'home/bar/page' : (BuildContext context) => HomeBarPage(),
        'dashboard/page' : (BuildContext context) => MyDashboardPage(),
      },
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
        appBarTheme: AppBarTheme(elevation: 0)
      ),
    );
  }
}
