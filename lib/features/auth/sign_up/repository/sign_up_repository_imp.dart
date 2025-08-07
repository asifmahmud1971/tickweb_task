import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/typedef/typedef.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_request.dart';
import '../../../../../data/network/api_urls.dart';
import '../../../../../data/network/http_method.dart';
import '../../sign_in/models/login_response.dart';
import 'sign_up_repository.dart';

/// Implementation of [SignUpRepository] responsible for handling user
/// registration and existence checks through API interactions.
///
/// This class utilizes [ApiRequest] to perform network operations.
///
/// **Type Definitions:**
/// - `Params`: Defined as `Map<String, dynamic>`, used for sending request
///   parameters to the API.
/// - `Result<T>`: Defined as `Future<Either<ApiFailure, T>>`, representing
///   an asynchronous operation that can result in either an [ApiFailure]
///   or a successful response of type `T`.
@Injectable(as: SignUpRepository)
class SignUpRepositoryImp implements SignUpRepository {
  /// Creates an instance of [SignUpRepositoryImp].
  ///
  /// Requires an [ApiRequest] instance to perform all underlying network calls.
  SignUpRepositoryImp({required this.apiRequest});

  /// The API request handler used to execute network operations.
  final ApiRequest apiRequest;

  /// Registers a new user with the provided email and password.
  ///
  /// This method sends a **POST** request to the [ApiUrls.register] endpoint.
  /// The `params` map should contain the necessary user registration data,
  /// typically including `email`, `password`, and any other required user
  /// details (e.g., `firstName`, `lastName`).
  ///
  /// On **successful registration**, it returns a [Right] containing a
  /// [LoginResponse] object, which usually includes user details and an
  /// authentication token.
  ///
  /// On **failure** (e.g., network error, invalid input, email already in use),
  /// it returns a [Left] containing an [ApiFailure] object with details
  /// about the error.
  ///
  /// Example `params` structure:
  /// ```dart
  /// {
  ///   'email': 'user@example.com',
  ///   'password': 'SecurePassword123!',
  ///   'firstName': 'Jane',
  ///   'lastName': 'Doe',
  /// }
  /// ```
  @override
  Result<LoginResponse> signUpWithEmail(Params params) {
    return apiRequest.performRequest(
      url: ApiUrls.register,
      method: HttpMethod.post,
      params: params,
      fromJson: LoginResponse.fromMap,
    );
  }

  /// Placeholder for Apple sign-up functionality.
  ///
  /// This method is currently not implemented and will throw an
  /// [UnimplementedError] if called.
  /// Integration with Apple's authentication services would be handled here.
  @override
  Result<LoginResponse> signUpWithApple(Params params) {
    throw UnimplementedError('signUpWithApple has not been implemented.');
  }

  /// Handles user registration via Google authentication.
  ///
  /// This method is intended to process the `params` obtained from a successful
  /// Google sign-in operation (e.g., Google ID token, access token, user profile data).
  /// It will typically send this information to your backend API to register
  /// or link the Google-authenticated user.
  ///
  /// On **successful registration or login**, it will return a [Right] containing
  /// a [LoginResponse] object.
  ///
  /// On **failure** (e.g., invalid Google token, API error, user already linked),
  /// it will return a [Left] containing an [ApiFailure].
  ///
  /// **Note:** This method is currently not implemented and will throw an
  /// [UnimplementedError] if called directly. You will replace the `throw`
  /// with your actual API call logic.
  ///
  /// Example `params` structure (may vary based on your backend API's needs):
  /// ```dart
  /// {
  ///   'idToken': 'your_google_id_token_here',
  ///   'accessToken': 'your_google_access_token_here', // Optional
  ///   'email': 'user.google@example.com', // Optional, if needed by backend
  ///   'displayName': 'Google User',       // Optional
  /// }
  /// ```
  ///

  /// Placeholder for Google sign-up functionality.
  ///
  /// This method is currently not implemented and will throw an
  /// [UnimplementedError] if called.
  /// Integration with Google's authentication services would be handled here.
  @override
  Result<LoginResponse> signUpWithGoogle(Params params) {
    throw UnimplementedError('signUpWithGoogle has not been implemented.');
  }

  /// Checks if a user with a given email already exists in the system.
  ///
  /// This method sends a **POST** request to the [ApiUrls.checkEmailExists] endpoint.
  /// The `params` map should typically contain the `email` to be checked.
  ///
  /// On **success**, it returns a [Future] containing a [Right] with a
  /// `dynamic` response. The exact type of this dynamic response depends
  /// on your API's specification (e.g., `{'exists': true}`, `{'status': 'found'}`).
  ///
  /// On **failure** (e.g., network issues, server errors), it returns a [Left]
  /// containing an [ApiFailure].
  ///
  /// Example `params` structure:
  /// ```dart
  /// {
  ///   'email': 'checkthis@example.com',
  /// }
  /// ```
  @override
  Future<Either<ApiFailure, dynamic>> checkUserExists(Params params) {
    return apiRequest.performRequest(
      url: ApiUrls.checkEmailExists,
      method: HttpMethod.post,
      params: params,
    );
  }
}
