part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    this.appStatus = AppStatus.initial,
    this.emailState = AppStatus.initial,
    this.emailErr = '',
    this.passwordState = AppStatus.initial,
    this.passwordErr = '',
    this.rememberMe = false,
  });

  final AppStatus appStatus;
  final AppStatus emailState;
  final String emailErr;
  final AppStatus passwordState;
  final String passwordErr;
  final bool rememberMe;

  SignInState copyWith({
    final AppStatus? appStatus,
    final AppStatus? emailState,
    final String? emailErr,
    final AppStatus? passwordState,
    final String? passwordErr,
    final bool? rememberMe,
  }) {
    return SignInState(
      appStatus: appStatus ?? this.appStatus,
      emailState: emailState ?? this.emailState,
      emailErr: emailErr ?? this.emailErr,
      passwordState: passwordState ?? this.passwordState,
      passwordErr: passwordErr ?? this.passwordErr,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        emailState,
        emailErr,
        passwordState,
        passwordErr,
        rememberMe,
      ];
}
