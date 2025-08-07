import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readback/core/components/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../generated/assets.dart';

class SocialButtonGroup extends StatelessWidget {
  const SocialButtonGroup({super.key, this.onGoogle, this.onApple});

  final VoidCallback? onGoogle;
  final VoidCallback? onApple;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            title: 'Google',
            isGradientColor: false,
            isPrefixEnable: true,
            icon: Assets.iconsGoogle,
            backgroundColor: AppColors.white,
            textColor: AppColors.font1,
            borderRadius: 100.r,
            onTap: onGoogle,
          ),
        ),
        if (Platform.isIOS) 20.horizontalSpace,
        if (Platform.isIOS)
          Expanded(
            child: CustomButton(
              title: 'Apple',
              icon: Assets.iconsApple,
              isPrefixEnable: true,
              isGradientColor: false,
              backgroundColor: AppColors.white,
              textColor: AppColors.font1,
              borderRadius: 100.r,
              onTap: onApple,
            ),
          ),
      ],
    );
  }
}
