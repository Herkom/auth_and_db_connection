import 'package:auth_and_db_connection/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc{

  final authRepository = AuthRepository();

  ///Sign In
  Future signIn(a, b) => authRepository.signInUserNumber(a, b);


  ///Sign Out
  signOut(){
    authRepository.signOut();
  }

  @override
    void dispose() {
  }
}