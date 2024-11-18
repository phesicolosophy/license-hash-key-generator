enum EnumRoot {home, licenseKey, jwtToken, about}

abstract class RootPage {
  static String get(EnumRoot enumRoot) {
    switch (enumRoot) {
      case EnumRoot.home: return '/';
      case EnumRoot.licenseKey: return '/license-key';
      case EnumRoot.jwtToken: return '/jwt-token';
      case EnumRoot.about: return '/about';
      default: return '/error';
    }
  }
}