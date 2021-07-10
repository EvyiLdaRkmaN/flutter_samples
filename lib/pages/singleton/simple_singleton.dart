class MySingleton {
  static MySingleton _instance = MySingleton._internal();
  String text;

  factory MySingleton() => _instance;

  MySingleton._internal();

}
