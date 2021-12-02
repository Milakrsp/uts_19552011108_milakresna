import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uts1/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //implementasi
    super.initState();
    mulaiAplikasi();
  }

  mulaiAplikasi() async {
    // jumlah waktu loading
    var waktuLoading = const Duration(seconds: 5);

    return Timer(waktuLoading, () {
      // mulai ke halaman dashboard
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Dashboard();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: new Stack(children: <Widget>[
        new Positioned(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "asset/images/fujifilm.png",
              height: 50,
            ),
          ),
        ),
        new Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Made With  ❤ | ©️ 2021",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ])),
    );
  }
}
