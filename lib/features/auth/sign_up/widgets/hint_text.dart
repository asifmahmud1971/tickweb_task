import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_style.dart';

class HintText extends StatelessWidget {
  const HintText({
    super.key,
    this.prefixText,
    this.suffixText,
    this.onTap,
    this.prefixTextStyle,
    this.suffixTextStyle,
  });

  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final prefixTs =
        prefixTextStyle ?? kBodySmallMedium.copyWith(color: AppColors.font1);

    final suffixTs = suffixTextStyle ??
        kBodySmallMedium.copyWith(color: AppColors.primary700);

    return RichText(
      text: TextSpan(
        children: [
          if (prefixText != null)
            TextSpan(
              text: prefixText,
              style: prefixTs,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          if (suffixText != null)
            TextSpan(
              text: suffixText,
              style: suffixTs,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
        ],
      ),
    );
  }
}
