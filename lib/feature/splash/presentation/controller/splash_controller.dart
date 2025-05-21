import 'package:cat_breeds_app/core/navigation/go_router.dart';
import 'package:cat_breeds_app/core/navigation/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  void build() => initializeApp();

  Future<void> initializeApp() async {
    // Simulate a delay for splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to the home screen
    ref.read(goRouterProvider).pushNamed(Routes.home.name);
  }
}
