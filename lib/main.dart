import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastguard/authentication_bloc/bloc.dart';
import 'package:fastguard/user_repository.dart';
import 'package:fastguard/home/home.dart';
import 'package:fastguard/login/login.dart';
import 'package:fastguard/splash_screen.dart';
import 'package:fastguard/simple_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //gak ngerti
  /// https://bloclibrary.dev/#/coreconcepts?id=blocdelegate
  BlocSupervisor.delegate = SimpleBlocDelegate();
  //ambil user repository untuk proses autentifikasi
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          return SplashScreen();
        },
      ),
    );
  }
}
