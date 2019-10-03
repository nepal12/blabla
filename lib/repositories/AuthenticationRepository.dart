import 'package:firebase_auth/firebase_auth.dart';
import 'package:blabla/providers/AuthenticationProvider.dart';
import 'package:blabla/providers/BaseProviders.dart';
import 'package:blabla/repositories/BaseRepository.dart';

class AuthenticationRepository extends BaseRepository {

  BaseAuthenticationProvider authenticationProvider = AuthenticationProvider();

  Future<FirebaseUser> signInWithGoogle() =>
      authenticationProvider.signInWithGoogle();

  Future<void> signOutUser() => authenticationProvider.signOutUser();

  Future<FirebaseUser> getCurrentUser() =>
      authenticationProvider.getCurrentUser();

  Future<bool> isLoggedIn() => authenticationProvider.isLoggedIn();

  @override
  void dispose() {
    authenticationProvider.dispose();
  }
}
