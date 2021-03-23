import 'package:flutter/material.dart';
import 'package:orderapp/screen/shop/view/gridDetail.dart';
import 'package:orderapp/screen/shop/view/listDetail.dart';

class GreenSalad extends StatefulWidget {
  const GreenSalad({
    Key key,
    @required this.countValue,
    @required this.aspectWidth,
    @required this.aspectHeight,
    @required this.isGrid,
  }) : super(key: key);

  final num countValue;
  final num aspectWidth;
  final num aspectHeight;
  final bool isGrid;

  @override
  _GreenSaladState createState() => _GreenSaladState();
}

class _GreenSaladState extends State<GreenSalad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.countValue,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: (widget.aspectWidth / widget.aspectHeight)),
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
              child: widget.isGrid == false ? GridDetail() : ListDetail(),
            );
          }),
    );
  }
}
