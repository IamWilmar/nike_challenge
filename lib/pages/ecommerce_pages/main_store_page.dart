import 'package:flutter/material.dart';

class MainStorePage extends StatefulWidget {
  @override
  _MainStorePageState createState() => _MainStorePageState();
}

class _MainStorePageState extends State<MainStorePage> {
  ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> searchBarVisible = ValueNotifier(true);
  double scrollAnterior = 0.0;
  @override
  void initState() {
    scrollController.addListener(() {
      // print(scrollController.offset);
      if (scrollController.offset < scrollAnterior - 10) {
        searchBarVisible.value = true;
      } else if (scrollController.offset > scrollAnterior + 10) {
        searchBarVisible.value = false;
      }
      if (scrollController.offset < 0.0) {
        searchBarVisible.value = true;
      }
      if (scrollController.offset > scrollController.position.maxScrollExtent) {
        searchBarVisible.value = false;
      }
      scrollAnterior = scrollController.offset;
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    controller: scrollController,
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
          ValueListenableBuilder<bool>(
            valueListenable: searchBarVisible,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1A1924),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Icon(Icons.map, color: Colors.white)),
                        Expanded(
                          child: Text(
                            'travel',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(seconds: 6),
                left: 0,
                right: 0,
                top: value ? 0 : -220,
                height: 220,
                child: child,
              );
            },
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
