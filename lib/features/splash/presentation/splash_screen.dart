import 'package:cat_breeds_app/feature/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashControllerProvider);
    return Scaffold(
      body: Center(
        child: Text('Welcome to the App!'),
      ),
    );
  }
}
