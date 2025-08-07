import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:readback/core/utils/validator.dart';

import '../../../../../core/enum/app_status.dart';
import '../../../../../core/mixin/cubit_mixin.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> with CubitMixin {
  SignInCubit() : super(const SignInState());

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void onChangeEmail(String v) {
    final msg = Validator.email(v);

    updateUi(
      state.copyWith(
        emailErr: msg ?? '',
        emailState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  void onChangePassword(String v) {
    final msg = Validator.password(v);

    updateUi(
      state.copyWith(
        passwordErr: msg ?? '',
        passwordState: msg == null ? AppStatus.valid : AppStatus.invalid,
      ),
    );
  }

  void reset() {
    emailCtrl.clear();
    passwordCtrl.clear();

    updateUi(
      state.copyWith(
        appStatus: AppStatus.initial,
        emailErr: '',
        emailState: AppStatus.initial,
        passwordErr: '',
        passwordState: AppStatus.initial,
      ),
    );
  }
}
