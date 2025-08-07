import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../sign_in/widgets/remember_me.dart';
import '../cubit/sign_up_cubit.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key, this.onTapTerms, this.onTapPolicy});

  final VoidCallback? onTapTerms;
  final VoidCallback? onTapPolicy;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RememberMe(
          text: RichText(
            text: TextSpan(
              text: 'I agree to the ',
              style: kBodyRegularRegular.copyWith(color: AppColors.font1),
              children: <TextSpan>[
                TextSpan(
                  text: 'Term & Condition',
                  style: kBodyRegularRegular.copyWith(
                    color: AppColors.primary500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTapTerms,
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy*.',
                  style: kBodyRegularRegular.copyWith(
                    color: AppColors.primary500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTapPolicy,
                ),
              ],
            ),
          ),
          isSelected: state.isAgreeWithTerms,
          onTap: () {
            cubit.updateUi(state.copyWith(
              isAgreeWithTerms: !state.isAgreeWithTerms,
            ));
          },
          margin: EdgeInsets.only(top: 3.h),
        );
      },
    );
  }
}
