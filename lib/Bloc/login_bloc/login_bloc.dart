import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is Login) {
        if(event.username.isEmpty||event.password.isEmpty) {
           emit(LoginFailure());
        } else {
          emit(LoginLoading());
          await Future.delayed(Duration(seconds: 2), () => emit(LoginLoaded(username: event.username)));
        }
       
      }
    });
  }
}
