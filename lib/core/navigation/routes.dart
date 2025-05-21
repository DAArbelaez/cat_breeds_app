class Routes {
  const Routes._({required this.name, required this.path});

  final String name;
  final String path;

  static const rootRoute = Routes._(name: 'root', path: '/');

  static const home = Routes._(name: 'home', path: '/home');
}
