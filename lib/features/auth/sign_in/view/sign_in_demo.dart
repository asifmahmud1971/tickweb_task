import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readback/core/components/custom_text_field.dart';
import 'package:readback/core/constants/app_colors.dart';
import 'package:readback/core/constants/app_text_style.dart';
import 'package:readback/generated/assets.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isBookmarked = false;
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            floating: true,
            snap: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.primary700,
                  image: DecorationImage(image: AssetImage(Assets.imagesAuthCover),
                    fit: BoxFit.cover,)
                )
              ),
              collapseMode: CollapseMode.pin,
            ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              10.verticalSpace,
              Text(
              'Log in',
              style: kHeading4.copyWith(color: AppColors.font1),
            ),
              Text(
                'Welcome back to Readback!',
                style: kBodyRegularRegular.copyWith(color: AppColors.font2),
              ),],),
          ),
        ),
            actions: [
              IconButton(
                icon: Icon(
                  _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: colors.onPrimary,
                ),
                onPressed: () {
                  setState(() {
                    _isBookmarked = !_isBookmarked;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isBookmarked
                            ? 'Added to bookmarks'
                            : 'Removed from bookmarks',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _emailCtrl,
                      title: 'Email',
                      hint: 'Enter your email',
                      // errorText: 'Please enter a valid email.',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      isEmail: true,
                      onChanged: (value) {},
                    ),

                    30.verticalSpace,

                    // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ),

                    // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ), // CustomTextField: Password
                    CustomTextField(
                      controller: _passwordCtrl,
                      title: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}