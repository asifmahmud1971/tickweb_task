import 'package:flutter/material.dart';
import '../../../../generated/assets.dart';

class FlyingAnimationDemo extends StatefulWidget {
  @override
  _FlyingAnimationDemoState createState() => _FlyingAnimationDemoState();
}

class _FlyingAnimationDemoState extends State<FlyingAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<double> _rotationAnimation1;
  late Animation<double> _rotationAnimation2;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration for the animation
      vsync: this,
    );

    // Define slide animations for both widgets
    _slideAnimation1 = Tween<Offset>(
      begin: Offset(-1.0, 1.0), // Start from bottom-left (off-screen)
      end: Offset.zero, // End at original position (center)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Easing curve for natural movement
    ));

    _slideAnimation2 = Tween<Offset>(
      begin: Offset(1.0, 1.0), // Start from bottom-right (off-screen)
      end: Offset.zero, // End at original position (center)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Easing curve for natural movement
    ));

    // Define rotation animations for both widgets
    _rotationAnimation1 = Tween<double>(
      begin: -0.785, // Start at -45 degrees (facing up-right)
      end: 0.0, // End at 0 degrees (facing right)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _rotationAnimation2 = Tween<double>(
      begin: 0.785, // Start at 45 degrees (facing up-left)
      end: 0.0, // End at 0 degrees (facing right)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start the animation only once when the screen opens
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First widget (flies diagonally from bottom-left to center)
        Container(
          height: 110, // Fixed height for the animation area
          width: 150,
          alignment: Alignment.centerLeft,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return SlideTransition(
                position: _slideAnimation2,
                child: Transform.rotate(
                  angle: _rotationAnimation2.value,
                  child: Center(
                    child: Image.asset(Assets.imagesPlane1),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 100, // Fixed height for the animation area
          width: 100,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return SlideTransition(
                position: _slideAnimation1,
                child: Transform.rotate(
                  angle: _rotationAnimation1.value,
                  child: Center(
                    child: Image.asset(Assets.imagesPlane2),
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
