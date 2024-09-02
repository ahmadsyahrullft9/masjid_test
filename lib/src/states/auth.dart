import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

enum AuthEvent {
  init,
  login,
  logout,
}

class AuthBloc extends Bloc<AuthEvent, AuthStatus> {
  AuthBloc() : super(AuthStatus.unauthenticated) {
    on<AuthEvent>((event, emit) {
      switch (event) {
        case AuthEvent.init:
        case AuthEvent.logout:
          emit(AuthStatus.unauthenticated);
        case AuthEvent.login:
          emit(AuthStatus.authenticated);
      }
    });
  }

  Stream<AuthStatus> mapEventToState(AuthEvent event) async* {
    switch (event) {
      case AuthEvent.init:
        yield AuthStatus.unauthenticated;
      case AuthEvent.login:
        await Future.delayed(const Duration(seconds: 2));
        yield AuthStatus.authenticated;
      case AuthEvent.logout:
        yield AuthStatus.unauthenticated;
    }
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
