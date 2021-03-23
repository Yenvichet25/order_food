import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Homepages extends StatefulWidget {
  const Homepages({
    Key key,
    @required this.size,
    @required this.imgList,
  }) : super(key: key);

  final Size size;
  final List<String> imgList;

  @override
  _HomepagesState createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  int _stars = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              //banner of foood
              Container(
                height: widget.size.height * 0.18,
                child: Swiper(
                  itemCount: widget.imgList.length,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration.millisecondsPerSecond,
                  autoplay: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  pagination: SwiperPagination(
                      margin: EdgeInsets.only(top: 10),
                      builder: SwiperPagination.dots),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      widget.imgList[index],
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Food for sale
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widget.size.width * 0.5,
                    child: ListTile(
                      title: Text(
                        "Sale",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Super summer sale"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  )
                ],
              ),
              Container(
                height: widget.size.height * 0.4,
                child: Column(
                  children: [
                    Container(
                      height: widget.size.height * 0.4,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                              width: 160,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/food.jpg"))),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: Container(
                                            width: 45,
                                            height: 28,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            child: Center(
                                                child: Text(
                                              "-15%",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 55,
                                    child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: FavoriteButton(
                                          iconSize: 38,
                                          iconColor: Colors.deepOrangeAccent,
                                          isFavorite: false,
                                          valueChanged: (_isFavorite) {
                                            print('Is Favorite : $_isFavorite');
                                          },
                                        )),
                                  ),
                                  Positioned(
                                    left: 5,
                                    bottom: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            _buildStar(1),
                                            _buildStar(2),
                                            _buildStar(3),
                                            _buildStar(4),
                                            _buildStar(5),
                                            Text(
                                              "(10)",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Vegetarian Salads",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
                                        ),
                                        Text(
                                          "Radicchio Salad",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "20\$",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // New food
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widget.size.width * 0.6,
                    child: ListTile(
                      title: Text(
                        "New",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("You've never seen it before!"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  )
                ],
              ),
              Container(
                height: widget.size.height * 0.4,
                child: Column(
                  children: [
                    Container(
                      height: widget.size.height * 0.4,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                              width: 160,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/food1.jpg"))),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: Container(
                                            width: 45,
                                            height: 28,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            child: Center(
                                                child: Text(
                                              "New",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 55,
                                    child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            boxShadow: [BoxShadow(
                                                color: Colors.black.withOpacity(0.3),
                                                blurRadius: 1,
                                                offset: Offset(0,1)
                                            )],
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: FavoriteButton(
                                          iconSize: 38,
                                          iconColor: Colors.deepOrangeAccent,
                                          isFavorite: false,
                                          valueChanged: (_isFavorite) {
                                            print('Is Favorite : $_isFavorite');
                                          },
                                        )),
                                  ),
                                  Positioned(
                                    left: 5,
                                    bottom: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            _buildStar(1),
                                            _buildStar(2),
                                            _buildStar(3),
                                            _buildStar(4),
                                            _buildStar(5),
                                            Text(
                                              "(10)",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Vegetarian Salads",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
                                        ),
                                        Text(
                                          "Radicchio Salad",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "20\$",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        size: 18,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }
}
