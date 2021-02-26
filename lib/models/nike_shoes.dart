class NikeShoes {
  NikeShoes({
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.images,
    this.modelNumber,
    this.color
  });

  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR MAX 90 EZ BLACK',
    currentPrice: 149,
    oldPrice: 299,
    modelNumber: 90,
    color: 0xFFF6F6F6,
    images: [
      'assets/nike_shoes_store/shoes1_1.png',
      'assets/nike_shoes_store/shoes1_2.png',
      'assets/nike_shoes_store/shoes1_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 95 Red',
    currentPrice: 299,
    oldPrice: 399,
    modelNumber: 95,
    color: 0xFFFEEFEF,
    images: [
      'assets/nike_shoes_store/shoes2_1.png',
      'assets/nike_shoes_store/shoes2_2.png',
      'assets/nike_shoes_store/shoes2_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 270 Gold',
    currentPrice: 199,
    oldPrice: 349,
    modelNumber: 270,
    color: 0xFFFEF7EB,
    images: [
      'assets/nike_shoes_store/shoes3_1.png',
      'assets/nike_shoes_store/shoes3_2.png',
      'assets/nike_shoes_store/shoes3_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 98 Free',
    currentPrice: 149,
    oldPrice: 299,
    modelNumber: 98,
    color: 0xFFEDF3FE,
    images: [
      'assets/nike_shoes_store/shoes4_1.png',
      'assets/nike_shoes_store/shoes4_2.png',
      'assets/nike_shoes_store/shoes4_3.png',
    ],
  ),
];
