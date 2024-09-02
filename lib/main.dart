import 'package:apptest/src/states/auth.dart';
import 'package:apptest/src/ui/home/home.dart';
import 'package:apptest/src/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:apptest/src/config/config.dart';
import 'package:apptest/src/routes/routes.dart';
import 'package:apptest/src/states/states.dart';
import 'package:apptest/src/ui/states/states.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => AuthBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  final _systemStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: authBloc.state == AuthStatus.unauthenticated
          ? APPPAGE.login.toPath
          : APPPAGE.home.toPath,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      errorBuilder: (context, state) => ViewError(
        message: state.error.toString(),
        close: () => context.pop(),
      ),
      redirectLimit: 1,
      redirect: (context, state) {
        final loginLocation = state.namedLocation(APPPAGE.login.toName);
        final homeLocation = state.namedLocation(APPPAGE.home.toName);

        final isGoingToLogin = state.matchedLocation == APPPAGE.login.toPath;
        final isGoingToHome = state.matchedLocation == APPPAGE.home.toPath;

        final authStatus = authBloc.state;

        if (authStatus == AuthStatus.unauthenticated && !isGoingToLogin) {
          return loginLocation;
        }

        if (authStatus == AuthStatus.authenticated && isGoingToLogin) {
          return homeLocation;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: APPPAGE.login.toPath,
          name: APPPAGE.login.toName,
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: APPPAGE.home.toPath,
          name: APPPAGE.home.toName,
          builder: (context, state) => const Home(),
        ),
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(_systemStyle);
    return MaterialApp.router(
      routerConfig: router,
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        primarySwatch: primaryMaterialColor,
        useMaterial3: false,
      ),
    );
  }
}
