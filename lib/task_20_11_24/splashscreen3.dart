import 'package:flutter/material.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  //swip to start "akshaj's work"
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'lib/assets/hireme_logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
