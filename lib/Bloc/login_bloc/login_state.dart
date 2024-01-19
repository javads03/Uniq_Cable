part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// Initial state of the login page
final class LoginInitial extends LoginState {}

// State of the login page when it is loading
final class LoginLoading extends LoginState {}

// State of the login page when it is loaded
final class LoginLoaded extends LoginState {
  final String username;
  LoginLoaded({required this.username});
}

// State of the login page when it is failed
final class LoginFailure extends LoginState {}
