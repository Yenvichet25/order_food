import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridDetail extends StatefulWidget {
  @override
  _GridDetailState createState() => _GridDetailState();
}

class _GridDetailState extends State<GridDetail> {
  int _stars = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: size.height*0.38,
              child: Stack(
                children: [
                  Container(
                    height: 210,
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
                    bottom: 50,
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
                    bottom:0,
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
          ],
        ),
      ),
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
