import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniq_cable/Bloc/login_bloc/login_bloc.dart';
import 'package:uniq_cable/screens/home/home_page.dart';
import 'package:uniq_cable/screens/login/login.dart';
// Import your login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(), // Provide your LoginBloc here
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
