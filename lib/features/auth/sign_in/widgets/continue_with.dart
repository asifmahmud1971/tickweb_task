import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_style.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: AppColors.font2, thickness: 1.h),
        ),
        10.horizontalSpace,
        Flexible(
          child: Text(
            'Or continue with',
            style: kBodyRegularRegular.copyWith(color: AppColors.font2),
          ),
        ),
        10.horizontalSpace,
        Expanded(child: Divider(color: AppColors.font2, thickness: 1.h)),
      ],
    );
  }
}
