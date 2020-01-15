import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastguard/authentication_bloc/bloc.dart';
import 'package:fastguard/user_repository/user_repository.dart';
import 'package:fastguard/home/pages/home_page.dart';
import 'package:fastguard/login/login.dart';
import 'package:fastguard/core/splash_screen.dart';
import 'package:fastguard/core/simple_bloc_delegate.dart';
import 'package:fastguard/fastguard_admin/admin_page.dart';
import 'package:fastguard/todos/todos.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      routes: {
        '/': (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Unauthenticated) {
                return LoginPage(userRepository: _userRepository);
              }
              if (state is Authenticated) {
                if (state.displayName == "allinstudio.dev@gmail.com")
                  return AdminPage(name: state.displayName);
                else
                  return HomePage(name: state.displayName);
              }
              return SplashPage();
            },
          );
        },
        '/todo': (context) {
          return TodosApp();
        },
      },
    );
  }
}
