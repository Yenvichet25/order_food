import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  int _stars = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          color: Colors.transparent,
          height: size.height * 0.2,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 2),
                            spreadRadius: 1,
                            blurRadius: 3)
                      ]),
                  child: Row(
                    children: [
                      // image
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/food.jpg"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 194,
                              child: Text(
                                "Massaged Kale with Tomatoes",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Vegetarian Salads",
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                _buildStar(1),
                                _buildStar(2),
                                _buildStar(3),
                                _buildStar(4),
                                _buildStar(5),
                                Text(
                                  "(10)",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black38),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "20\$",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 0,
                child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              offset: Offset(0, 1))
                        ],
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
            ],
          ),
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
