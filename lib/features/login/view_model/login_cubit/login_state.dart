 class LoginState {}

final class LoginInitialState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {
   final String message;
   LoginSuccessState({required this.message});
}
final class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
}


