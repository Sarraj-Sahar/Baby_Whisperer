import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider();
});

class UserProvider extends ChangeNotifier {
  final _userRepositiry = UserRepository();

  bool _isLoading = false;
  AuthUser? _currentUser;

  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _currentUser;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Either<String, SignUpResult>> signUp(
      String username, String password, String email) async {
    _setIsLoading(true);
    final response = await _userRepositiry.signUp(username, email, password);
    _setIsLoading(false);
    return response;
  }

  Future<Either<String, bool>> confirmSignUp(
      {required String username,
      required String password,
      required String code}) async {
    _setIsLoading(true);
    final response = await _userRepositiry.confirmSignUp(
      username: username,
      password: password,
      code: code,
    );
    _setIsLoading(false);
    return response;
  }

  Future<Either<String, SignInResult>> signIn(
      {required String username, required String password}) async {
    _setIsLoading(true);
    final response = await _userRepositiry.signIn(
      username: username,
      password: password,
    );
    final user = await _userRepositiry.getCurrentUser();
    _currentUser = user;
    _setIsLoading(false);
    //Temp : attempting to reactivate the DataStore sync
    print("Awaitingggggg Amplify.DataStore.start()");
    await Amplify.DataStore.start();
    return response;
  }

  Future<AuthUser?> checkedLogedInUser() async {
    final authSession = await _userRepositiry.isUserLoggedIn();

    if (authSession.isSignedIn) {
      _currentUser = await _userRepositiry.getCurrentUser();
      return _currentUser;
    }
    return null;
  }

  Future<Either<String, SignOutResult>> signOut() async {
    _setIsLoading(true);
    try {
      final response = await _userRepositiry.signOut();
      _currentUser = null;
      _setIsLoading(false);
      //Temp : clearing store
      print('LOGGING OUTTTT');
      await Amplify.DataStore.clear();
      //
      return right(response);
    } on AuthException catch (e) {
      _setIsLoading(false);
      return left(e.message);
    }
  }
}
