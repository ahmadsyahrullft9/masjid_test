import 'config.dart';

extension AppPageExtension on APPPAGE {
  String get toPath {
    switch (this) {
      case APPPAGE.login:
        return "/login";
      case APPPAGE.home:
        return "/home";
    }
  }

  String get toName {
    switch (this) {
      case APPPAGE.login:
        return "login";
      case APPPAGE.home:
        return "home";
    }
  }
}
