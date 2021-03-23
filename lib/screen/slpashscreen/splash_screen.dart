import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orderapp/screen/dashbord/dashbord_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            if (mounted) {
              setState(() {});
            }
          });
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    if (mounted) {
      Future.delayed(Duration(milliseconds: 5000), () {
        animationController.reverse(from: 0.0)
          ..then((value) => Navigator.push(
              context,
              CupertinoPageRoute(
                  fullscreenDialog: true, builder: (_) => DashBordPage())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/splashscreen.gif",
            fit: BoxFit.contain,
          ),
          // Loading go to login page
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SpinKitThreeBounce(
                size: 22,
                color: Colors.black,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    ));
  }
}
