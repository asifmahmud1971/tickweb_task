import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readback/core/components/custom_svg.dart';
import 'package:readback/core/constants/app_colors.dart';

class TabIcon extends StatelessWidget {
  final String? icon;
  const TabIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: AppColors.primary500,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 20,
          ),
        ],
      ),
      child: CustomSvg(
        icon: icon??"",
        size: 20.r,
      ),
    );
  }
}
