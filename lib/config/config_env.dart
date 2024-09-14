import 'env.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static String? baseUrl;

  static void setupEnv(Environment envType) {
    switch (envType) {
      case Environment.dev:
        setupEnvironment(devUrl);
        break;
      case Environment.prod:
        setupEnvironment(prodUrl);
    }
  }

  static void setupEnvironment(String url) {
    baseUrl = url;
  }
}
