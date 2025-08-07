import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/enum/app_status.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/mixin/cubit_mixin.dart';
import '../../../../core/utils/validator.dart';
import '../models/label.dart';
import '../utils/phone_service.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> with CubitMixin {
  SignUpCubit() : super(const SignUpState());

  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();

  DateTime selectedDob = DateTime.now();
  Label? selectedCountry;

  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  void onChangeFirstName(String v) {
    if (v.trim().isEmpty) {
      updateUi(
        state.copyWith(firstNameErr: '', firstNameState: AppStatus.initial),
      );
      return;
    }

    final msg = Validator.firstName(v);

    updateUi(
      state.copyWith(
        firstNameErr: msg ?? '',
        firstNameState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  void onChangeLastName(String v) {
    if (v.trim().isEmpty) {
      updateUi(
          state.copyWith(lastNameErr: '', lastNameState: AppStatus.initial));
      return;
    }

    final msg = Validator.lastName(v);

    updateUi(
      state.copyWith(
        lastNameErr: msg ?? '',
        lastNameState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  void onChangeEmail(String v) {
    if (v.trim().isEmpty) {
      updateUi(state.copyWith(emailErr: '', emailState: AppStatus.initial));
      return;
    }

    final msg = Validator.email(v);

    updateUi(
      state.copyWith(
        emailErr: msg ?? '',
        emailState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  final selectedPhoneCountry = CountryCode.fromJson(
    {
      "name": "Switzerland",
      "code": "CH",
      "flagUri": 'flags/${"CH".toLowerCase()}.png',
      "dial_code": "+41"
    },
  );

  String? countryCode;
  String? countryPhoneCode;

  void onChangePhone(String value, code) {
    bool isValid = false;

    final length = PhoneService.phoneLength(dialCode: code);

    if (value.length <= length!.maxLength && value.length >= length.minLength) {
      isValid = true;
    }

    if (isValid) {
      updateUi(state.copyWith(phoneErr: '', phoneState: AppStatus.valid));
    } else {
      updateUi(state.copyWith(
        phoneErr: AppStrings.phoneInvalidErr.tr(),
        phoneState: AppStatus.invalid,
      ));
    }
  }

  void onChangePassword(String v) {
    if (v.trim().isEmpty) {
      updateUi(state.copyWith(
        passwordErr: '',
        passwordState: AppStatus.initial,
      ));
      return;
    }

    final msg = Validator.password(v);

    updateUi(
      state.copyWith(
        passwordErr: msg ?? '',
        passwordState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );

    onChangeConfirmPassword(confirmPasswordCtrl.text);
  }

  void onChangeConfirmPassword(String v) {
    if (v.trim().isEmpty) {
      updateUi(state.copyWith(
        confirmPasswordErr: '',
        confirmPasswordState: AppStatus.initial,
      ));

      return;
    }

    final msg = Validator.confirmPassword(v, passwordCtrl.text);

    updateUi(
      state.copyWith(
        confirmPasswordErr: msg ?? '',
        confirmPasswordState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  void resetForm() {
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    emailCtrl.clear();
    dobCtrl.clear();
    phoneCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();

    selectedCountry = null;
    selectedDob = DateTime.now();

    updateUi(state.copyWith(
      appStatus: AppStatus.initial,
      firstNameErr: '',
      firstNameState: AppStatus.initial,
      lastNameErr: '',
      lastNameState: AppStatus.initial,
      emailErr: '',
      emailState: AppStatus.initial,
      phoneErr: '',
      phoneState: AppStatus.initial,
      passwordErr: '',
      passwordState: AppStatus.initial,
      confirmPasswordErr: '',
      confirmPasswordState: AppStatus.initial,
      dobState: AppStatus.initial,
      isCalenderVisible: false,
      countryState: AppStatus.initial,
      isAgreeForNewsletter: false,
      isAgreeWithTerms: false,
    ));
  }
}
