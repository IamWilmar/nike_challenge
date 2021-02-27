import 'package:flutter/material.dart';
import 'package:nike_challenge/pages/ecommerce_pages/categories_store_page.dart';
import 'package:nike_challenge/pages/ecommerce_pages/favorite_store_page.dart';
import 'package:nike_challenge/pages/ecommerce_pages/profile_store_page.dart';

import 'main_store_page.dart';

class HomeStorePage extends StatefulWidget {
  @override
  _HomeStorePageState createState() => _HomeStorePageState();
}

class _HomeStorePageState extends State<HomeStorePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  String routeName;
  @override
  void initState() {
    routeName = 'main_store';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Navigator(
            key: _navigatorKey,
            initialRoute: 'main_store',
            onGenerateRoute: (RouteSettings settings){
              WidgetBuilder builder;
              switch (settings.name){
                case 'main_store':
                  builder = (BuildContext context) => MainStorePage();
                  break;
                case 'favorite_store':
                  builder = (BuildContext context) => FavoriteStorePage();
                  break;
                case 'category_store':
                  builder = (BuildContext context) => CategoresStorePage();
                  break;
                case 'profile_store':
                  builder = (BuildContext context) => ProfileStorePage();
                  break;
                default:
                throw Exception('Ivalid Route');
              }
              return MaterialPageRoute(
                builder: builder,
                settings: settings
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: kToolbarHeight,
            child: Container(
              color: Color(0xFF1A1924).withOpacity(1),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.grey[500],
                      ),
                      onTap: () {
                        setState(() {
                          _navigatorKey.currentState.pushNamed('main_store');
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey[500],
                      ),
                      onTap: () {
                        setState(() {
                          _navigatorKey.currentState.pushNamed('favorite_store');
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.grid_view,
                        color: Colors.grey[500],
                      ),
                      onTap: () {
                        setState(() {
                          _navigatorKey.currentState.pushNamed('category_store');
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey[500],
                      ),
                      onTap: () {
                        setState(() {
                          _navigatorKey.currentState.pushNamed('profile_store');
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


