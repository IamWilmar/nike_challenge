import 'package:flutter/material.dart';
import 'package:nike_challenge/pages/ecommerce_pages/categories_store_page.dart';
import 'package:nike_challenge/pages/ecommerce_pages/favorite_store_page.dart';
import 'package:nike_challenge/pages/ecommerce_pages/main_store_page.dart';
import 'package:nike_challenge/pages/ecommerce_pages/profile_store_page.dart';
import 'package:nike_challenge/pages/home_page.dart';
import 'package:nike_challenge/pages/tree_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home'            : (_) => HomePage(),
  'tree'            : (_) => TreePage(),
  'main_store'      : (_) => MainStorePage(), 
  'favorite_store'  : (_) => FavoriteStorePage(),
  'category_store'  : (_) => CategoresStorePage(),
  'profile_store'   : (_) => ProfileStorePage(),
};