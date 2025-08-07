import '../../../../../core/typedef/typedef.dart';
import '../../sign_in/models/login_response.dart';

abstract class SignUpRepository {
  Result<LoginResponse> signUpWithEmail(Params params);

  Result<LoginResponse> signUpWithGoogle(Params params);

  Result<LoginResponse> signUpWithApple(Params params);

  Result<dynamic> checkUserExists(Params params);
}
