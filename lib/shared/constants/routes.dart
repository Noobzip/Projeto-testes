class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AAAAD6hUqcs:APA91bH0LAz4GJAZsQBXqrpZQj0eIe4t3JFUkEt6AkvavYm2IL3YsC4WBeHsUdla-9jKhuGF01RLVRpBo39WE3iGu_oiTt9lr7kKHprCPcL1r3G86O5xG1pPFmB38jBK0uuBYoQzpT9N";

  static const String apiKey = "AIzaSyCTSXE4ddMB53tTjRPvzde1tP3dSbmzZy4";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}
