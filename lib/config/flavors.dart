enum Flavor { prod, dev }

extension FlavorName on Flavor {
  String get name => toString().split('.').last;
}

class F {
  static Flavor appFalvor = Flavor.dev;
  static String get name => appFalvor.name;

  static String get title {
    switch (appFalvor) {
      case Flavor.dev:
        return 'TM System Dev';
      case Flavor.prod:
        return 'TM System';
      default:
        return 'TM System';
    }
  }

  static String get apiBaseUrl {
    switch (appFalvor) {
      case Flavor.dev:
        return 'https://dev-tmsystem-api.telphatech.com';
      case Flavor.prod:
        return 'https://prod-tmsystem-api.telphatech.com';
      default:
        return 'https://prod-tmsystem-api.telphatech.com';
    }
  }
}
