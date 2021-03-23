import 'package:flutter/material.dart';
import 'package:orderapp/screen/shop/other/Grilled.dart';
import 'package:orderapp/screen/shop/other/greenSalad.dart';
import 'package:orderapp/screen/shop/other/salads.dart';
import 'package:orderapp/screen/shop/other/tomatoes.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  TabController tabController;
  int _selectedIndex = 0;
  int index;
  List<Widget> _pages = [];

  final List<String> _tab = ["Green Salad", "Grilled", "Tomatoes", "Salads"];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  num countValue = 2;
  num aspectWidth = 1.1;
  num aspectHeight = 1.8;
  bool isGrid;

  changeModeGrid() {
    setState(() {
      isGrid = false;
      countValue = 2;
      aspectWidth = 1.1;
      aspectHeight = 1.8;
    });
  }

  changeModeList() {
    setState(() {
      isGrid = true;
      countValue = 1;
      aspectWidth = 3;
      aspectHeight = 1.3;
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    tabController = TabController(length: _tab.length, vsync: this);
    setState(() {
      isGrid = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _pages = [
      GreenSalad(
          countValue: countValue,
          aspectWidth: aspectWidth,
          aspectHeight: aspectHeight,
          isGrid: isGrid),
      Grilled(),
      Tomatoes(),
      Salad()
    ];
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                width: size.width,
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.2,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Vegan Salads",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TabBar(
                                  controller: tabController,
                                  isScrollable: true,
                                  labelColor: Colors.white,
                                  indicator: BoxDecoration(),
                                  unselectedLabelColor: Colors.white,
                                  onTap: (index) {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  tabs: List.generate(
                                      _tab.length,
                                      (index) => Tab(
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              child: Center(
                                                  child: Text(_tab[index])),
                                              decoration: BoxDecoration(
                                                  color: _selectedIndex == index
                                                      ? Colors.green
                                                      : Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0)),
                                            ),
                                          ))),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.filter_list),
                                      onPressed: () {}),
                                  Text("Filter")
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                          Icons.wifi_protected_setup_rounded),
                                      onPressed: () {}),
                                  Text("Price: lowest to high")
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // view
                                  Row(
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: RawMaterialButton(
                                            onPressed: () {
                                              changeModeList();
                                            },
                                            child: Icon(
                                              Icons.list_alt_sharp,
                                              size: 22,
                                            )),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: RawMaterialButton(
                                            onPressed: () {
                                              changeModeGrid();
                                            },
                                            child: Icon(
                                              Icons.grid_view,
                                              size: 22,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              height: size.height,
              child: PageView.builder(
                  itemCount: _tab.length,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                      print("tabbar index $_selectedIndex");
                      print("page view index: $index");
                    });
                  },
                  itemBuilder: (_, index) {
                    return _pages[_selectedIndex];
                  }),
            ),
          )
        ],
      ),
    );
  }
}
