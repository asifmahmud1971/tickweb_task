import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();

  static const String liveUrl =
      'https://api.github.com/'; //live server
  static const String devUrl =
      'https://api.github.com/'; // dev server
  static const String testUrl =
      'https://api.github.com/'; // test server

  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // shop module
  static const String repoUrl = 'search/repositories';

  static const String login = 'login';
  static const String register = 'register';
  static const String checkEmailExists = 'check-email-exists';
  static const String registerSendOtp = 'register/send-otp';
  static const String registerVerifyOtp = 'register/verify-otp';
  static const String registerResendOtp = 'register/resend-otp';

  static const String forgotPasswordSendEmail = 'forgot-password';
  static const String forgotPasswordVerifyOtp = 'forgot-password/verify-otp';
  static const String forgotPasswordResendOtp = 'forgot-password/resend-otp';
  static const String forgotPasswordUpdatePassword =
      'forgot-password/update-password';


}
