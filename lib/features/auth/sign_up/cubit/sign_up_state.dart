part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.appStatus = AppStatus.initial,
    this.firstNameErr = '',
    this.firstNameState = AppStatus.initial,
    this.lastNameErr = '',
    this.lastNameState = AppStatus.initial,
    this.emailErr = '',
    this.emailState = AppStatus.initial,
    this.dobState = AppStatus.initial,
    this.isCalenderVisible = false,
    this.countryState = AppStatus.initial,
    this.phoneErr = '',
    this.phoneState = AppStatus.initial,
    this.passwordErr = '',
    this.passwordState = AppStatus.initial,
    this.confirmPasswordErr = '',
    this.confirmPasswordState = AppStatus.initial,
    this.isAgreeForNewsletter = false,
    this.isAgreeWithTerms = false,
  });

  final AppStatus appStatus;
  final String firstNameErr;
  final AppStatus firstNameState;

  final String lastNameErr;
  final AppStatus lastNameState;

  final String emailErr;
  final AppStatus emailState;

  final AppStatus dobState;
  final bool isCalenderVisible;

  final AppStatus countryState;

  final String phoneErr;
  final AppStatus phoneState;

  final String passwordErr;
  final AppStatus passwordState;

  final String confirmPasswordErr;
  final AppStatus confirmPasswordState;

  final bool isAgreeForNewsletter;
  final bool isAgreeWithTerms;

  @override
  List<Object> get props => [
        appStatus,
        firstNameErr,
        firstNameState,
        lastNameErr,
        lastNameState,
        emailErr,
        emailState,
        dobState,
        isCalenderVisible,
        countryState,
        phoneErr,
        phoneState,
        passwordErr,
        passwordState,
        confirmPasswordErr,
        confirmPasswordState,
        isAgreeForNewsletter,
        isAgreeWithTerms,
      ];

  SignUpState copyWith({
    final AppStatus? appStatus,
    final String? firstNameErr,
    final AppStatus? firstNameState,
    final String? lastNameErr,
    final AppStatus? lastNameState,
    final String? emailErr,
    final AppStatus? emailState,
    final AppStatus? dobState,
    final bool? isCalenderVisible,
    final AppStatus? countryState,
    final String? phoneErr,
    final AppStatus? phoneState,
    final String? passwordErr,
    final AppStatus? passwordState,
    final String? confirmPasswordErr,
    final AppStatus? confirmPasswordState,
    final bool? isAgreeForNewsletter,
    final bool? isAgreeWithTerms,
  }) {
    return SignUpState(
      appStatus: appStatus ?? this.appStatus,
      firstNameErr: firstNameErr ?? this.firstNameErr,
      firstNameState: firstNameState ?? this.firstNameState,
      lastNameErr: lastNameErr ?? this.lastNameErr,
      lastNameState: lastNameState ?? this.lastNameState,
      emailErr: emailErr ?? this.emailErr,
      emailState: emailState ?? this.emailState,
      dobState: dobState ?? this.dobState,
      isCalenderVisible: isCalenderVisible ?? this.isCalenderVisible,
      countryState: countryState ?? this.countryState,
      phoneErr: phoneErr ?? this.phoneErr,
      phoneState: phoneState ?? this.phoneState,
      passwordErr: passwordErr ?? this.passwordErr,
      passwordState: passwordState ?? this.passwordState,
      confirmPasswordErr: confirmPasswordErr ?? this.confirmPasswordErr,
      confirmPasswordState: confirmPasswordState ?? this.confirmPasswordState,
      isAgreeForNewsletter: isAgreeForNewsletter ?? this.isAgreeForNewsletter,
      isAgreeWithTerms: isAgreeWithTerms ?? this.isAgreeWithTerms,
    );
  }
}
