import 'package:injectable/injectable.dart';

import '../../../../../core/typedef/typedef.dart';
import '../../../../../data/network/api_request.dart';
import '../../../../../data/network/api_urls.dart';
import '../../../../../data/network/http_method.dart';
import '../models/login_response.dart';
import 'sign_in_repository.dart';

/// Implementation of [SignInRepository] that handles user authentication
/// processes through API calls.
///
/// This class is responsible for logging in users via various methods
/// (email/password, Google, Apple) by interacting with a backend API.
///
/// **Dependency Injection:**
/// This class is marked with `@Injectable(as: SignInRepository)` for
/// automatic dependency injection, meaning it can be provided wherever
/// [SignInRepository] is required in your application's dependency graph.
///
/// **Type Definitions Used:**
/// - `Params`: Defined as `Map<String, dynamic>`, used for sending request
///   parameters to the API.
/// - `Result<T>`: Defined as `Future<Either<ApiFailure, T>>`, representing
///   an asynchronous operation that can result in either an [ApiFailure]
///   or a successful response of type `T`.
@Injectable(as: SignInRepository)
class SignInRepositoryImp implements SignInRepository {
  /// Creates an instance of [SignInRepositoryImp].
  ///
  /// Requires an [ApiRequest] instance to perform all underlying network calls.
  SignInRepositoryImp({required this.apiRequest});

  /// The API request handler used to execute network operations.
  ///
  /// This instance is responsible for making HTTP requests and parsing
  /// the responses into the desired data models or handling API failures.
  final ApiRequest apiRequest;

  /// Authenticates a user using their email and password.
  ///
  /// This method sends a **POST** request to the [ApiUrls.login] endpoint.
  /// The `params` map should contain the user's credentials.
  ///
  /// On **successful authentication**, it returns a [Right] containing a
  /// [LoginResponse] object, which typically includes user details and an
  /// authentication token.
  ///
  /// On **failure** (e.g., invalid credentials, network error, server error),
  /// it returns a [Left] containing an [ApiFailure] object with details
  /// about the error.
  ///
  /// Example `params` structure:
  /// ```dart
  /// {
  ///   'email': 'user@example.com',
  ///   'password': 'YourPassword123!',
  /// }
  /// ```
  @override
  Result<LoginResponse> loginWithEmail(Params params) {
    return apiRequest.performRequest(
      url: ApiUrls.login,
      method: HttpMethod.post,
      params: params,
      fromJson: LoginResponse.fromMap,
    );
  }

  /// Placeholder for Apple login functionality.
  ///
  /// This method is currently not implemented and will throw an
  /// [UnimplementedError] if called.
  /// When implemented, it would handle the integration with Apple's
  /// authentication services and communicate with your backend.
  @override
  Result<LoginResponse> loginWithApple(Params params) {
    throw UnimplementedError('loginWithApple has not been implemented.');
  }

  /// Placeholder for Google login functionality.
  ///
  /// This method is currently not implemented and will throw an
  /// [UnimplementedError] if called.
  /// When implemented, it would handle the integration with Google's
  /// authentication services and communicate with your backend.
  @override
  Result<LoginResponse> loginWithGoogle(Params params) {
    throw UnimplementedError('loginWithGoogle has not been implemented.');
  }
}
