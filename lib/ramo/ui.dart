import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ramo/ramo/ui/widget/card.dart';

import 'ui/widget/category.dart';
import 'ui/widget/cobon.dart';
import 'ui/widget/costum_navi.dart';
import 'ui/widget/trade_mark.dart';

final List<String> imagePaths = [
  'assets/image/1.png',
  'assets/image/2.png',
  'assets/image/3.png',
  'assets/image/4.png',
  'assets/image/5.png',
  'assets/image/6.png',
];
final List<Category> categories = [
  Category(
    name: 'الجوالات',
    imageAssetPath: 'assets/image/phones.png',
    id: 'mobiles',
  ),
  Category(
    name: 'البقالة',
    imageAssetPath: 'assets/image/becala.png',
    id: 'groceries',
  ),
  Category(
    name: 'المنزل الذكي',
    imageAssetPath: 'assets/image/smarthome.png',
    id: 'smart_home',
  ),

  Category(
    name: 'الملابس',
    imageAssetPath: 'assets/image/clothes.png',
    id: 'groceries',
  ),
  Category(
    name: 'الطيران والسفر',
    imageAssetPath: 'assets/image/tiran.png',
    id: 'mobiles',
  ),
  Category(
    name: 'الملابس',
    imageAssetPath: 'assets/image/clothes.png',
    id: 'smart_home',
  ),
  Category(
    name: 'الجوالات',
    imageAssetPath: 'assets/image/phones.png',
    id: 'mobiles',
  ),
];
final List<String> offers = [
  'assets/image/offers.png',
  'assets/image/offers.png',
  'assets/image/offers.png',
];

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Screen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fc),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/image/bell.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/image/Group.png', height: 40),
                        const Text(
                          ' GO OFFER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF323EDE),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/image/button.png',
                        height: 28.97,
                        width: 29,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: '...ابحث هنا',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 22,
                        horizontal: 22,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/image/search.png',
                          height: 48,
                          width: 29,
                        ),
                      ),

                      prefixIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/Ellipse.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset(
                          'assets/image/inside.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      MyOfferCard(),
                      SizedBox(width: 16),
                      MyOfferCard(),
                      SizedBox(width: 16),
                      MyOfferCard(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: CategoriesWidget(allCategories: categories),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: HorizontalImageList(imageUrls: offers),
              ),
              // const Spacer(),
              SizedBox(height: 16),
              Container(
                height: 179,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/example.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'تـــصــفح حســب العــلامات الـــتجــارية',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    HorizontalImageList2(
                      imageUrls: [
                        'assets/image/trade_mark1.png',
                        'assets/image/trade_mark2.png',
                        'assets/image/trade_mark3.png',
                        'assets/image/trade_mark1.png',
                        'assets/image/trade_mark2.png',
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'خصيصا لك',
                  textDirection:
                      TextDirection.rtl, // Keep RTL for correct text flow
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF343EE1),
                  ),
                  textAlign: TextAlign.start, // Align to the start (left)
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 182 / 198.82,
                children:
                    imagePaths.map((path) {
                      return Image.asset(
                        path,
                        width: 185,
                        height: 198.82,
                        fit: BoxFit.fill,
                      );
                    }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "مضافة حديثا",
                  textDirection:
                      TextDirection.rtl, // Keep RTL for correct text flow
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF343EE1),
                  ),
                  textAlign: TextAlign.start, // Align to the start (left)
                ),
              ),

              HorizontalImageList(imageUrls: offers),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Image.asset(
                    'assets/image/green.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      'assets/image/white_gradient.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text(
                              "عروض وكوبونات خاصة بمناسبة\nاليوم الوطني الـــ94",
                              textAlign: TextAlign.center,
                              textDirection:
                                  TextDirection
                                      .rtl, // Keep RTL for correct text flow
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, right: 20),
                          child: Text(
                            "العروض و الكوبونات",
                            textAlign: TextAlign.center,
                            textDirection:
                                TextDirection
                                    .rtl, // Keep RTL for correct text flow
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        HorizontalImageList(imageUrls: offers),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "كوبونك الخاص",
                  textDirection:
                      TextDirection.rtl, // Keep RTL for correct text flow
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF343EE1),
                  ),
                  textAlign: TextAlign.start, // Align to the start (left)
                ),
              ),

              HorizontalImageList(imageUrls: offers),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 198.82,
                    child: Image.asset(
                      'assets/image/Layer_1.png',
                      fit: BoxFit.contain,
                      width: 182,
                      height: 198.82,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/image/Ellipse_row1.png',
                          width: 14,
                          height: 14,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/image/Ellipse_row2.png',
                          width: 9,
                          height: 9,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/image/Ellipse_row2.png',
                          width: 9,
                          height: 9,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/image/Ellipse_row2.png',
                          width: 9,
                          height: 9,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
