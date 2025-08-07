import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:readback/core/components/custom_svg.dart';
import 'package:readback/core/components/custom_text_field.dart';
import 'package:readback/core/constants/app_strings.dart';
import 'package:readback/core/constants/app_text_style.dart';
import 'package:readback/core/enum/app_status.dart';
import 'package:readback/generated/assets.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/layouts/auth_layout.dart';
import '../../../../core/app/app_dependency.dart';
import '../../../../core/app/app_preference.dart';
import '../../../../core/components/input_label.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/router/routes.dart';
import '../../sign_in/widgets/auth_footer_text.dart';
import '../../sign_in/widgets/continue_with.dart';
import '../../sign_in/widgets/remember_me.dart';
import '../../sign_in/widgets/social_button_group.dart';
import '../cubit/sign_up_cubit.dart';
import '../models/label.dart';
import '../widgets/phone_field_decoration.dart';
import '../widgets/terms_and_condition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return AuthLayout(
      pageName: AppStrings.signUp.tr(),
      subtitle: AppStrings.signUpWelcomeMessage.tr(),
      child: SingleChildScrollView(
        padding: kScreenPadding,
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final isPhoneNumberValid = cubit.phoneCtrl.text.isEmpty ||
                state.phoneState == AppStatus.valid;

            final isButtonEnable = state.firstNameState == AppStatus.valid &&
                state.lastNameState == AppStatus.valid &&
                state.emailState == AppStatus.valid &&
                state.dobState == AppStatus.valid &&
                state.countryState == AppStatus.valid &&
                state.passwordState == AppStatus.valid &&
                state.confirmPasswordState == AppStatus.valid &&
                state.isAgreeWithTerms == true &&
                isPhoneNumberValid;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomTextField : First Name
                CustomTextField(
                  controller: cubit.firstNameCtrl,
                  title: AppStrings.firstNameLabel.tr(),
                  hint: AppStrings.firstNameHint.tr(),
                  errorText:
                      state.firstNameErr == '' ? null : state.firstNameErr,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  isError: state.firstNameState == AppStatus.invalid,
                  onChanged: cubit.onChangeFirstName,
                ),

                kPadding,

                // CustomTextField: Last Name
                CustomTextField(
                  controller: cubit.lastNameCtrl,
                  title: AppStrings.lastNameLabel.tr(),
                  hint: AppStrings.lastNameHint.tr(),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChanged: cubit.onChangeLastName,
                  errorText: state.lastNameErr == '' ? null : state.lastNameErr,
                  isError: state.lastNameState == AppStatus.invalid,
                ),

                kPadding,

                // CustomTextField: Email
                CustomTextField(
                  controller: cubit.emailCtrl,
                  title: AppStrings.emailLabel.tr(),
                  hint: AppStrings.emailHint.tr(),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: cubit.onChangeEmail,
                  errorText: state.emailErr == '' ? null : state.emailErr,
                  isError: state.emailState == AppStatus.invalid,
                ),

                kPadding,

                // CustomTextField: Date of Birth
                CustomTextField(
                  controller: cubit.dobCtrl,
                  title: AppStrings.dobLabel.tr(),
                  hint: AppStrings.dobHint.tr(),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  readOnly: true,
                  suffixIcon: Center(
                    child: CustomSvg(icon: Assets.iconsCalendar),
                  ),
                  onTap: () => _onOpenDatePicker(context),
                ),

                if (state.isCalenderVisible) kPadding,

                Visibility(
                  visible: state.isCalenderVisible,
                  child: Container(
                    padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE0E1E0).withValues(alpha: 0.4),
                          blurRadius: 52,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        dayMaxWidth: 30,
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now().subtract(
                          const Duration(days: 6580),
                        ),
                        controlsTextStyle:
                            kBodyMedium.copyWith(color: AppColors.font1),

                        weekdayLabelTextStyle:
                            kBodyRegularMedium.copyWith(color: AppColors.font1),

                        dayTextStyle:
                            kBodyMediumRegular.copyWith(color: AppColors.font1),

                        // weekdayLabels: [
                        //   AppStrings.birthdayPickerWeekSun.tr(),
                        //   AppStrings.birthdayPickerWeekMon.tr(),
                        //   AppStrings.birthdayPickerWeekTue.tr(),
                        //   AppStrings.birthdayPickerWeekWed.tr(),
                        //   AppStrings.birthdayPickerWeekThu.tr(),
                        //   AppStrings.birthdayPickerWeekFri.tr(),
                        //   AppStrings.birthdayPickerWeekSat.tr(),
                        // ],
                      ),
                      value: [DateTime.now()],
                      onValueChanged: (dates) async {
                        String iso8601 = dates.first.toIso8601String();
                        cubit.selectedDob = DateTime.parse(iso8601);

                        final dateTime = DateTime.parse(iso8601);
                        String formattedDate =
                            DateFormat('dd.MM.yyyy').format(dateTime);

                        // Load app language.
                        final language =
                            instance.get<AppPreferences>().getLanguage();

                        if (language == 'en') {
                          formattedDate =
                              DateFormat('dd.MM.yyyy').format(dateTime);
                        } else if (language == 'de') {
                          formattedDate =
                              DateFormat('dd.MM.yyyy').format(dateTime);
                        } else {
                          formattedDate =
                              DateFormat('dd.MM.yyyy').format(dateTime);
                        }

                        cubit.dobCtrl.text = formattedDate;
                        cubit.updateUi(state.copyWith(
                          isCalenderVisible: !state.isCalenderVisible,
                          dobState: AppStatus.valid,
                        ));
                      },
                    ),
                  ),
                ),

                kPadding,

                InputLabel(title: AppStrings.countryLabel.tr()),

                // DropdownButtonFormField2: Country*
                DropdownButtonFormField2<Label>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    alignLabelWithHint: true,
                  ),
                  hint: Text(
                    AppStrings.countryHint.tr(),
                    style:
                        kBodyRegularRegular.copyWith(color: AppColors.gray200),
                  ),
                  items: Label.countries
                      .map(
                        (item) => DropdownMenuItem<Label>(
                          value: item,
                          child: Text(
                            item.label.tr(),
                            style: kBodyRegularRegular.copyWith(
                              color: AppColors.font1,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: cubit.selectedCountry,
                  // onSaved: (value) => cubit.selectedCountry = value!,
                  onChanged: (value) {
                    cubit.updateUi(
                      state.copyWith(countryState: AppStatus.valid),
                    );

                    cubit.selectedCountry = value!;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CustomSvg(icon: Assets.iconsArrowDown, size: 10),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    offset: const Offset(0, -16),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),

                kPadding,

                InputLabel(title: 'Phone Number', isRequired: false),

                IntlPhoneField(
                  controller: cubit.phoneCtrl,
                  cursorColor: AppColors.primary700,
                  style: kBodyMedium.copyWith(color: AppColors.font1),
                  languageCode: context.locale.languageCode,
                  initialCountryCode: "CH",
                  pickerDialogStyle: PickerDialogStyle(
                    searchFieldCursorColor: AppColors.gray900,
                    searchFieldInputDecoration: InputDecoration(
                      hintText: 'searchCountry',
                      hintStyle: kBodyMedium.copyWith(color: AppColors.gray300),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray100,
                          width: .6,
                        ),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: AppColors.gray100, width: .6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: AppColors.gray100,
                            width: .6), // Border on focus
                      ),
                    ),
                    listTileDivider: Divider(color: AppColors.gray200),
                    countryCodeStyle:
                        kBodyMedium.copyWith(color: AppColors.gray900),
                    countryNameStyle: kBodyMedium.copyWith(
                      color: AppColors.gray900,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onCountryChanged: (country) {
                    cubit.countryCode = '+${country.dialCode}';
                    cubit.countryPhoneCode = country.code;
                  },
                  onChanged: (value) {
                    cubit.countryCode = _formatDialCode(value.countryCode);
                    cubit.onChangePhone(value.number, value.countryCode);
                  },
                  invalidNumberMessage: state.phoneErr,
                  decoration: inputDecoration,
                  showDropdownIcon: false,
                  flagsButtonPadding: EdgeInsetsGeometry.only(left: 10.w),
                  validator: null,
                ),

                kPadding,

                // CustomTextField: Password
                CustomTextField(
                  controller: cubit.passwordCtrl,
                  title: AppStrings.passwordLabel.tr(),
                  hint: AppStrings.passwordHint.tr(),
                  isPassword: true,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  onChanged: cubit.onChangePassword,
                  errorText: state.passwordErr == '' ? null : state.passwordErr,
                  isError: state.passwordState == AppStatus.invalid,
                ),

                kPadding,

                // CustomTextField: Confirm Password
                CustomTextField(
                  controller: cubit.confirmPasswordCtrl,
                  title: AppStrings.confirmPasswordLabel.tr(),
                  hint: AppStrings.confirmPasswordHint.tr(),
                  isPassword: true,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  onChanged: cubit.onChangeConfirmPassword,
                  errorText: state.confirmPasswordErr == ''
                      ? null
                      : state.confirmPasswordErr,
                  isError: state.confirmPasswordState == AppStatus.invalid,
                ),

                kPadding,

                RememberMe(
                  text: Text(
                    AppStrings.newsletterText.tr(),
                    textAlign: TextAlign.start,
                    style: kBodyRegularRegular.copyWith(color: AppColors.font1),
                  ),
                  isSelected: state.isAgreeForNewsletter,
                  onTap: () {
                    cubit.updateUi(state.copyWith(
                      isAgreeForNewsletter: !state.isAgreeForNewsletter,
                    ));
                  },
                  margin: EdgeInsets.only(top: 3.h),
                ),

                8.verticalSpace,

                TermsAndCondition(),

                kPadding,

                CustomButton(
                  title: AppStrings.signUpButton.tr(),
                  isGradientColor: false,
                  onTap: isButtonEnable ? () {} : null,
                ),

                kPadding,

                ContinueWith(),

                kPadding,

                SocialButtonGroup(onGoogle: () {}, onApple: () {}),

                kPadding,

                AuthFooterText(
                  prefixText: AppStrings.alreadyHaveAccount.tr(),
                  suffixText: AppStrings.logInButton.tr(),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.signIn,
                      (route) => false,
                    );
                  },
                ),

                100.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }

  String _formatDialCode(String code) => '+${code.replaceAll('+', '')}';

  void _onOpenDatePicker(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final isCalenderVisible = cubit.state.isCalenderVisible;

    cubit.updateUi(cubit.state.copyWith(isCalenderVisible: !isCalenderVisible));
  }
}
