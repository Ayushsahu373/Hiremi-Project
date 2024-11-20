import 'package:flutter/material.dart';
import 'package:wyreflow_intern_ayush/task_20_11_24/splashscreen3.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 1 second, then navigate to the next screen
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FinalScreen()), // Replace FinalScreen with your next screen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

