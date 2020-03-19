
import 'auth_api.dart';

class AuthRepository{

  final authAPI = AuthAPI();

  Future signInUserNumber(a, b) =>  authAPI.signIn(a, b);

  signOut() => authAPI.signOut();

}