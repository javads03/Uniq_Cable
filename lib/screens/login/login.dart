import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniq_cable/Bloc/home_bloc/home_bloc_bloc.dart';
import 'package:uniq_cable/Bloc/login_bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.of(context).pushNamed('/home', arguments: state.username);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return buildInitialInput();
        }
      },
    ));
  }
}

Widget buildInitialInput() => Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.asset(
                'assets/images/curve_bg.png',
                fit: BoxFit.fitWidth,
              ),
              Image.asset(
                'assets/images/curve_noise.png',
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: 260,
                  left: 25,
                  child: Image.asset('assets/images/uniq.png')),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 36.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.0,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 60,
                    height: 2, // Assuming square container based on width value
                    decoration: BoxDecoration(
                      color: Color(0xFF008081),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3.45064377784729, 3.45064377784729),
                          blurRadius: 3.45064377784729,
                          color: Color(0xFF000000).withOpacity(0.40),
                        ),
                      ],
                    ),

                    // Other child widgets can be added here
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Username',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.0,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  _usernameField(),
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.0,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  _passwordField(),
                  SizedBox(height: 100),
                  LoginButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget _usernameField() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'demo@gmail.com',
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: Colors.black.withOpacity(0.5),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF008081)),
      ),
      alignLabelWithHint: true,
    ),
    validator: (value) {},
  );
}

Widget _passwordField() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: '********',
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: Colors.black.withOpacity(0.5),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF008081)),
      ),
      alignLabelWithHint: true,
    ),
    obscureText: true,
    validator: (value) {},
  );
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LoginBloc>(context).add(Login(
                username: "admin",
                password:
                    "123456") // Add username and password here to test login
            );
      },
      child: Container(
        width: 310.44,
        height: 48.31,
        decoration: BoxDecoration(
          color: Color(0xFF008080),
          borderRadius: BorderRadius.circular(43.13),
          // Add other decoration properties if needed
        ),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
