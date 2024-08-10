abstract class LoginStates {}

class InitaialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class SucessLoginState extends LoginStates {}

class FalledLoginState extends LoginStates {
  final String error;
  FalledLoginState({required this.error});
}
