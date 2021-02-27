import 'package:flutter/material.dart';
import 'package:nike_challenge/pages/ecommerce_pages/home_store_page.dart';

const double _buttonSize = 200.0;

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFF1A1924),
          ),
          Positioned.fill(
            left: 0,
            right: 0,
            bottom: 20,
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 300,
            ),
          ),
          Positioned(
            left: size.width / 2 - _buttonSize / 2,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              width: _buttonSize,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xFF55C1B2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  //TODO: Transicion Circular
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 10),
                      reverseTransitionDuration: Duration(seconds:10),
                      pageBuilder: (context, animation1, animation2){
                        return FadeTransition(
                          opacity: animation1,
                          child: HomeStorePage(),
                        );
                      }
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
