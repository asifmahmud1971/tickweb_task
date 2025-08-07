import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/app/app_dependency.dart';
import '../../../../core/app/app_preference.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/routes.dart';
import '../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;

  SplashScreen({super.key}) : _appPreferences = instance.get();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  bool _showFinalImage = false;
  late final AnimationController _controller;
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    AssetLottie(Assets.imagesSlashAnimJson).load();

    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        _showFinalImage = true;
      });

      _timer = Timer(const Duration(seconds: 2), _navigateNext);
    });
  }

  void _navigateNext() {
    if (!mounted) return;

    final isLoggedIn = widget._appPreferences.isUserLoggedIn();
    Navigator.pushNamedAndRemoveUntil(
      context,
      isLoggedIn ? Routes.dashboard : Routes.dashboard,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: _showFinalImage
            ? Image.asset(
                Assets.imagesLogo,
                width: 300.r,
                height: 300.r,
              )
            : Lottie.asset(
                Assets.imagesSlashAnimJson,
                controller: _controller,
                width: 600.r,
                height: 600.r,
                onLoaded: (composition) {
                  // Start playing the animation when it's loaded
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
      ),
    );
  }
}
