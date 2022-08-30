class GlobalData {
  static String? _globalAuth;
  static String? _userId;

  /// User Auth
  static setGlobalAuth(String authKey){
    _globalAuth = authKey;
  }

  static get globalAuth => _globalAuth;


  /// User ID
  static setGlobalUserId(String userId){
    _userId = userId;
  }

  static get userId => _userId;

}