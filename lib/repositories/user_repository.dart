import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  //signUp user
  Future<Either<String, SignUpResult>> signUp(
      String username, String email, String password) async {
    final Map<AuthUserAttributeKey, String> userAttributes = {
      AuthUserAttributeKey.email: email
    };

    try {
      final result = await Amplify.Auth.signUp(
        username: username.trim(),
        password: password.trim(),
        options: SignUpOptions(userAttributes: userAttributes),
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  //confirm user with amplify's confirmSignUp
  Future<Either<String, bool>> confirmSignUp(
      {required String username,
      required String password,
      required String code}) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        // adding the .trim() to ignore whitespaces
        username: username.trim(),
        confirmationCode: code.trim(),
      );
      return right(result.isSignUpComplete);
      //TOREMOVE : @sahar remove this
      // signIn(username: username, password: password);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  //signIn user with username and pwd
  Future<Either<String, SignInResult>> signIn(
      {required String username, required String password}) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username.trim(),
        password: password.trim(),
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  //Check if user is logged in
  Future<AuthSession> isUserLoggedIn() {
    return Amplify.Auth.fetchAuthSession();
  }

  //If user is logged in then fetch the user
  Future<AuthUser> getCurrentUser() {
    return Amplify.Auth.getCurrentUser();
  }

  //Sign out user
  Future<SignOutResult> signOut() {
    return Amplify.Auth.signOut();
  }
}
