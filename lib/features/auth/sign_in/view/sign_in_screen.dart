import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readback/core/components/custom_text_field.dart';
import 'package:readback/core/enum/app_status.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/layouts/auth_layout.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/router/routes.dart';
import '../../sign_up/widgets/hint_text.dart';
import '../cubit/sign_in_cubit.dart';
import '../widgets/auth_footer_text.dart';
import '../widgets/continue_with.dart';
import '../widgets/remember_me.dart';
import '../widgets/social_button_group.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    return AuthLayout(
      pageName: 'Log in',
      subtitle: 'Welcome back to Readback!',
      child: SingleChildScrollView(
        padding: kScreenPadding,
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomTextField: Email
                CustomTextField(
                  controller: cubit.emailCtrl,
                  title: 'Email',
                  hint: 'Enter your email',
                  errorText: state.emailErr == '' ? null : state.emailErr,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  isEmail: true,
                  onChanged: cubit.onChangeEmail,
                ),

                kPadding,

                // CustomTextField: Password
                CustomTextField(
                  controller: cubit.passwordCtrl,
                  title: 'Password',
                  hint: 'Enter your password',
                  isPassword: true,
                  obscureText: true,
                  errorText: state.passwordErr == '' ? null : state.passwordErr,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  onChanged: cubit.onChangePassword,
                ),

                10.verticalSpace,

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RememberMe(
                        text: Text(
                          'Remember me',
                          textAlign: TextAlign.start,
                          style:
                              kBodySmallMedium.copyWith(color: AppColors.font1),
                        ),
                        onTap: () {
                          cubit.updateUi(
                            state.copyWith(rememberMe: !state.rememberMe),
                          );
                        },
                        isSelected: cubit.state.rememberMe,
                        
                      ),
                    ),
                    HintText(prefixText: 'Forgot Password?'),
                  ],
                ),

                kPadding,

                CustomButton(
                  title: 'Log in',
                  isGradientColor: false,
                  onTap: state.emailState == AppStatus.valid &&
                          state.passwordState == AppStatus.valid
                      ? () {}
                      : null,
                ),

                kPadding,

                ContinueWith(),

                kPadding,

                SocialButtonGroup(
                  onGoogle: () {},
                  onApple: () {},
                ),

                kPadding,

                AuthFooterText(
                  prefixText: 'Don’t have an account? ',
                  suffixText: 'Sign up',
                  onTap: _onNavigateToSignUp,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onNavigateToSignUp() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.signUp,
      (route) => false,
    );
  }
}
