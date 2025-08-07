class AppStrings {
  // ======================= [Text Validation] =======================

  static const String firstNameEmptyErr = "Please enter your first name.";
  static const String firstNameLeadingOrTrailingSpaceErr = "First name cannot start or end with a space.";
  static const String firstNameInvalidCharErr = "First name should not contain special characters.";
  static const String firstNameMinLengthErr = "First name must contain at least 3 characters.";
  static const String firstNameMaxLengthErr = "First name must not exceed 30 characters.";

  static const String lastNameEmptyErr = "Please enter your last name.";
  static const String lastNameLeadingOrTrailingSpaceErr = "Last name cannot start or end with a space.";
  static const String lastNameInvalidCharErr = "Last name should not contain special characters.";
  static const String lastNameMinLengthErr = "Last name must contain at least 2 characters.";
  static const String lastNameMaxLengthErr = "Last name must not exceed 30 characters.";

  static const String emailEmptyErr = "Please enter your email address.";
  static const String emailInvalidErr = "Please enter a valid email address.";
  
  static const String phoneInvalidErr = "Please enter a valid phone number.";

  static const String passwordEmptyErr = "Please enter your password.";
  static const String passwordMinLengthErr = "Password must contain at least 6 characters.";
  static const String passwordMaxLengthErr = "Password must not exceed 20 characters.";
  static const String passwordUppercaseCharErr = "Password must contain at least one uppercase letter.";
  static const String passwordLowercaseCharErr = "Password must contain at least one lowercase letter.";
  static const String passwordNumberCharErr = "Password must contain at least one number.";
  static const String passwordSpecialCharErr = "Password must contain at least one special character.";

  static const String confirmPasswordEmptyErr = "Please re-enter your password.";
  static const String passwordsDoNotMatchErr = "Passwords do not match.";

  // ======================= [Text Validation] =======================

  // ======================= [Sign Up] =======================
  static const signUp = 'Sign Up';
  static const signUpWelcomeMessage = 'Welcome to Readback!';
  static const firstNameLabel = 'First Name';
  static const firstNameHint = 'Enter your first name';
  static const lastNameLabel = 'Last Name';
  static const lastNameHint = 'Enter your last name';
  static const emailLabel = 'Email';
  static const emailHint = 'Enter your email';
  static const dobLabel = 'Date of Birth';
  static const dobHint = 'DD.MM.YYYY';

  static const countryLabel = 'Country';
  static const countryHint = 'Select Country';

  static const passwordLabel = 'Password';
  static const passwordHint = 'Create password';
  static const confirmPasswordLabel = 'Confirm Password';
  static const confirmPasswordHint = 'Confirm password';
  static const newsletterText =
      'I would like to receive newsletter and other promotional information.';
  static const signUpButton = 'Sign Up';
  static const alreadyHaveAccount = 'Already have an account? ';
  static const logInButton = 'Log in';
  // ======================= [Sign Up] =======================

  static const String password = "password";
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String internalServerError = "internalServerError";
  static const String noInternetConnection = "noInternetConnection";
  static const String serverError = "serverError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String cacheError = "cacheError";
  static const String unexpectedError = "unexpectedError";
  static const String defaultError = "defaultError";
  static const String success = "success";
  static const String noInternetMessage = "noInternetMessage";
  static const String tryAgain = "tryAgain";
  static const String noConnection = "noConnection";

  static const String checkoutAddressCompanyNameMax100Char =
      "checkoutAddressCompanyNameMax100Char";
  static const String checkoutAddressCountryOrRegionRequired =
      "checkoutAddressCountryOrRegionRequired";
  static const String checkoutAddressCountryOrRegionMax100 =
      "checkoutAddressCountryOrRegionMax100";
  static const String checkoutAddressStreetRequired =
      "checkoutAddressStreetRequired";
  static const String checkoutAddressStreetMax100 =
      "checkoutAddressStreetMax100";
  static const String checkoutAddressLocationOrCityRequired =
      "checkoutAddressLocationOrCityRequired";
  static const String checkoutAddressLocationOrCityMax100 =
      "checkoutAddressLocationOrCityMax100";
  static const String checkoutAddressPostalCodeRequired =
      "checkoutAddressPostalCodeRequired";
  static const String checkoutAddressPostalCodeMax100 =
      "checkoutAddressPostalCodeMax100";
  static const String checkoutAddressCommentsMax500 =
      "checkoutAddressCommentsMax500";
  
  static const String provideValidNumber = "provideValidNumber";
  static const String signUpDobRequiredErr = "signUpDobRequiredErr";

  static const String noPageFound = "noPageFound";
  static const String moreLoad = "moreLoad";
  static const String searchInputText = "searchInputText";
  static const String no = "no";
  static const String yes = "yes";

  /// Dashboard screen strings
  static const String home = "Home";
  static const String chats = "Chats";
  static const String user = "User";
  static const String totalProgress = "Total Progress";
  static const String country = "Country";
  static const String classTitle = "Class";
  static const String totalTimeSpent = "Total Time Spent";
  static const String skillLevel = "Skill Level";
  static const String basicLevel = "Basic Level";
  static const String advanceLevel = "Advance Level";
  static const String intermediateLevel = "Intermediate Level";
}
