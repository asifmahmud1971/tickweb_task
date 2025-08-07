import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_checkbox.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
    this.margin,
  });

  final Widget text;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomCheckbox(isSelected: isSelected, onTap: onTap, margin: margin),
          5.horizontalSpace,
          Expanded(child: text)
        ],
      ),
    );
  }
}
