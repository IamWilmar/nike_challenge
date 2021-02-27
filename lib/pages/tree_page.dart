import 'package:flutter/material.dart';
import 'package:nike_challenge/pages/ecommerce_pages/splash_page.dart';
import 'package:nike_challenge/pages/home_page.dart';

class TreePage extends StatelessWidget {

  _goToProject(BuildContext context, Widget route) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 10),
        reverseTransitionDuration: Duration(seconds: 10),
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: route,
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            color: Colors.black,
            child:
                Text('Nike Challenge', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _goToProject(context, HomePage());
            },
          ),
          RaisedButton(
            color: Colors.black,
            child:
                Text('Ecommerce', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _goToProject(context, SplashPage());
            },
          ),
        ],
      ),
    ));
  }
}
