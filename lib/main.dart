import 'package:flutter/material.dart';
import 'package:nike_challenge/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike Challenge',
      initialRoute: 'tree',
      routes: appRoutes,
    );
  }
}