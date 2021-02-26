import 'package:flutter/material.dart';
import 'package:nike_challenge/models/nike_shoes.dart';

const _buttonWidthSize = 180.0;
const _buttonHeightSize = 60.0;
const _buttonCircularSize = 60.0;
const _circularImageSize = 50.0;
const _imageSize = 150.0;

class ShoppingCartPage extends StatefulWidget {
  final NikeShoes shoes;
  const ShoppingCartPage({Key key, @required this.shoes}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationResize;
  Animation _animationMovementIn;
  Animation _animationMovementOut;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 35));
    _animationResize = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.2)));
    _animationMovementIn = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 0.6, curve: Curves.easeInBack),
      ),
    );
    _animationMovementOut = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 0.85, curve: Curves.slowMiddle),
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildShopScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentImageSize = (_imageSize * _animationResize.value)
        .clamp(_circularImageSize, _imageSize);
    return TweenAnimationBuilder<double>(
      duration: Duration(seconds: 13),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, value * size.height * 0.6),
          child: child,
        );
      },
      child: Container(
        height: (size.height * 0.6 * _animationResize.value)
            .clamp(_buttonCircularSize, size.height * 0.6),
        width: (size.width * _animationResize.value)
            .clamp(_buttonCircularSize, size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft:
                _animationResize.value != 1 ? Radius.circular(30) : Radius.zero,
            bottomRight:
                _animationResize.value != 1 ? Radius.circular(30) : Radius.zero,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: _animationResize.value != 1
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.shoes.images.first,
                    height: currentImageSize,
                  ),
                  if (_animationResize.value == 1) ...[
                    SizedBox(width: 20),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.shoes.model,
                          style: TextStyle(fontSize: 10.0),
                        ),
                        Text(
                          '\$${widget.shoes.currentPrice.toInt().toString()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final buttonSizeWidth = (_buttonWidthSize * _animationResize.value)
                .clamp(_buttonCircularSize, _buttonWidthSize);
            final buttonSizeHeight =
                (_buttonHeightSize * _animationResize.value)
                    .clamp(_buttonCircularSize, _buttonHeightSize);

            final panelSizeWidth = (size.width * _animationResize.value)
                .clamp(_buttonCircularSize, size.width);
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black38,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: <Widget>[
                      if (_animationMovementIn.value != 1) ...[
                        Positioned(
                          width: panelSizeWidth,
                          left: size.width / 2 - panelSizeWidth / 2,
                          top: size.height * 0.4 +
                              _animationMovementIn.value * size.height * 0.453,
                          child: _buildShopScreen(context),
                        ),
                      ],
                      Positioned(
                        bottom: 40 - _animationMovementOut.value * 100,
                        left: size.width / 2 - buttonSizeWidth / 2,
                        child: TweenAnimationBuilder(
                          duration: Duration(seconds: 13),
                          tween: Tween(begin: 1.0, end: 0.0),
                          curve: Curves.easeIn,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0.0, value * size.height * 0.6),
                              child: child,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              _controller.forward();
                            },
                            child: Container(
                              width: buttonSizeWidth,
                              height: buttonSizeHeight,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Expanded(
                                      child: Icon(
                                        Icons.shopping_bag_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (_animationResize.value == 1) ...[
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'ADD TO CART',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
