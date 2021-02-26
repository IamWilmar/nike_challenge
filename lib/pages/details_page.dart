import 'package:flutter/material.dart';
import 'package:nike_challenge/animations/shake_transition.dart';
import 'package:nike_challenge/models/nike_shoes.dart';
import 'package:nike_challenge/pages/shopping_cart.dart';

class DetailsPage extends StatelessWidget {
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);
  final NikeShoes shoes;
  DetailsPage({
    Key key,
    @required this.shoes,
  }) : super(key: key);

  Widget _buildCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'background_${shoes.model}',
              child: Container(
                color: Color(shoes.color),
              ),
            ),
          ),
          Positioned(
            left: 70,
            right: 70,
            top: 10,
            child: Hero(
              tag: 'number_${shoes.model}',
              child: ShakeTransition(
                offset: 20,
                axis: Axis.vertical,
                duration: Duration(seconds: 50),
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      shoes.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.05),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: shoes.images.length,
            itemBuilder: (_, i) {
              final tag =
                  i == 0 ? 'image_${shoes.model}' : 'image_${shoes.model}_$i';
              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  duration: Duration(seconds: 50),
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      shoes.images[i],
                      height: 220,
                      width: 220,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _openShoppingCart(BuildContext context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        reverseTransitionDuration: Duration(seconds: 7),
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: ShoppingCartPage(shoes: shoes),
          );
        },
      ),
    );
    notifierButtonsVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/nike_shoes_store/nike_logo.png',
          height: 40,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: [
                _buildCarousel(context),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShakeTransition(
                        duration: Duration(seconds: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(shoes.model,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${shoes.oldPrice.toInt().toString()}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text(
                                    '\$${shoes.currentPrice.toInt().toString()}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ShakeTransition(
                        duration: Duration(seconds: 35),
                        child: Text(
                          'AVAILABLE SIZES',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ShakeTransition(
                        duration: Duration(seconds: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _ShoesSizeItem(text: '6'),
                            _ShoesSizeItem(text: '7'),
                            _ShoesSizeItem(text: '9'),
                            _ShoesSizeItem(text: '10'),
                            _ShoesSizeItem(text: '6'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('DESCRIPTION', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierButtonsVisible,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: 'fav_1',
                  backgroundColor: Colors.white,
                  child:
                      Icon(Icons.favorite_border_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  heroTag: 'fav_2',
                  backgroundColor: Colors.black,
                  child: Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    _openShoppingCart(context);
                  },
                ),
              ],
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0 : -kToolbarHeight * 1.5,
                duration: Duration(seconds: 10),
                child:
                    Padding(padding: const EdgeInsets.all(20.0), child: child),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ShoesSizeItem extends StatelessWidget {
  final String text;
  const _ShoesSizeItem({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        'US $text',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }
}
