enum Flavor {
  dev,
  staging,
  prod
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return "App Dev";
      case Flavor.staging:
        return "App Staging";
      case Flavor.prod:
        return "App";
      default:
        return "App";
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return "https://api.dev.example.com";
      case Flavor.staging:
        return "https://api.staging.example.com";
      case Flavor.prod:
        return "https://api.example.com";
      default:
        return "https://api.example.com";
    }
  }
}
