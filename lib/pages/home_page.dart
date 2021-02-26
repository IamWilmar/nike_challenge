import 'package:flutter/material.dart';
import 'package:nike_challenge/models/nike_shoes.dart';
import 'package:nike_challenge/pages/details_page.dart';

class HomePage extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  _onShoesPressed(BuildContext context, NikeShoes shoe) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 7),
        reverseTransitionDuration: Duration(seconds: 7),
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: DetailsPage(shoes: shoe),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/nike_shoes_store/nike_logo.png',
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom:40),
                    physics: BouncingScrollPhysics(),
                    itemCount: shoes.length,
                    itemBuilder: (_, i) => NikeShoesItem(
                        shoe: shoes[i],
                        onTap: () {
                          _onShoesPressed(context, shoes[i]);
                        }),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierBottomBarVisible,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(Icons.home),
                  ),
                  Expanded(
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: Icon(Icons.favorite_border),
                  ),
                  Expanded(
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 13,
                    ),
                  ),
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                  duration: Duration(seconds: 10),
                  left: 0,
                  right: 0,
                  bottom: value ? 0 : -kToolbarHeight,
                  height: kToolbarHeight,
                  child: child);
            },
          ),
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoe;
  final VoidCallback onTap;
  const NikeShoesItem({
    Key key,
    @required this.shoe,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'background_${shoe.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(shoe.color),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'number_${shoe.model}',
                  child: SizedBox(
                    height: itemHeight * 0.6,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          shoe.modelNumber.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.05),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 85,
                height: itemHeight * 0.65,
                child: Hero(
                  tag: 'image_${shoe.model}',
                  child: Image.asset(
                    shoe.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Icon(Icons.favorite_border, color: Colors.grey),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(shoe.model, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    Text(
                      '\$${shoe.oldPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${shoe.currentPrice.toInt().toString()}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
