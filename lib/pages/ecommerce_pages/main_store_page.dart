import 'package:flutter/material.dart';

class MainStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context). size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 50, top: 220),
                    physics: BouncingScrollPhysics(),
                    children: [
                      Cards(color: Color(0xFFF4E390)),
                      Cards(color: Color(0xFFF4A259)),
                      Cards(color: Color(0xFF5B8E7D)),
                      Cards(color: Color(0xFFF4E390)),
                      Cards(color: Color(0xFFF4A259)),
                      Cards(color: Color(0xFF5B8E7D)),
                      Cards(color: Color(0xFFF4E390)),
                      Cards(color: Color(0xFFF4A259)),
                      Cards(color: Color(0xFF5B8E7D)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            height: 220,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1A1924),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final Color color;
  Cards({
    Key key,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      height: 150,
    );
  }
}
