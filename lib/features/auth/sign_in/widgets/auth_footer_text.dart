import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_style.dart';
import '../../sign_up/widgets/hint_text.dart';

class AuthFooterText extends StatelessWidget {
  const AuthFooterText({
    super.key,
    required this.prefixText,
    required this.suffixText,
    this.onTap,
  });

  final String prefixText;
  final String suffixText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HintText(
        prefixText: prefixText,
        prefixTextStyle: kBodyRegularRegular.copyWith(color: AppColors.font1),
        suffixText: suffixText,
        suffixTextStyle: kBodyRegularSemibold.copyWith(
          color: AppColors.primary700,
        ),
        onTap: onTap,
      ),
    );
  }
}
