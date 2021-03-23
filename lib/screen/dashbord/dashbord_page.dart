import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderapp/screen/card/card_page.dart';
import 'package:orderapp/screen/favorite/favorite_page.dart';
import 'package:orderapp/screen/home/homepages.dart';
import 'package:orderapp/screen/profile/userprofile.dart';
import 'package:orderapp/screen/shop/shop_page.dart';

class DashBordPage extends StatefulWidget {
  @override
  _DashBordPageState createState() => _DashBordPageState();
}

class _DashBordPageState extends State<DashBordPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  final List<String> imgList = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
    "assets/images/banner1.png",
    "assets/images/banner4.png",
    "assets/images/banner5.png",
    "assets/images/banner6.png"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _pages = [
      Homepages(size: size, imgList: imgList),
      ShopPage(),
      FavoritePage(),
      CardPage(),
      UserProfile()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
            ),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Order ទាន់ចិត្ដ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          CupertinoButton(
            onPressed: () {},
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 22,
            ),
          )
        ],
      ),
      body: Container(
          width: size.width,
          height: size.height,
          child: _pages.elementAt(_currentIndex)),
    );
  }
}
