import 'package:flutter/material.dart';
import 'package:wyreflow_intern_ayush/task_20_11_24/splash_screen2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();

    
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration for zoom
      vsync:
          this, 
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward().then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NextScreen()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.6,
            colors: [Color(0xFF234CE6), Color(0xFF132A80)],
            stops: [0.18, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      'lib/assets/tie_logo.png',
                      width: 100,
                      height: 100,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
