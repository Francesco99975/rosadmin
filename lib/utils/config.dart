class AppConfig {
  static const devMode = String.fromEnvironment("ENVIROMENT") == "development";
  static const isLoggedIn = false;
  static const logHttp = true;
}
