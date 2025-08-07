import '../../../../../core/typedef/typedef.dart';
import '../models/login_response.dart';

abstract class SignInRepository {
  Result<LoginResponse> loginWithEmail(Params params);
  Result<LoginResponse> loginWithGoogle(Params params);
  Result<LoginResponse> loginWithApple(Params params);
}
