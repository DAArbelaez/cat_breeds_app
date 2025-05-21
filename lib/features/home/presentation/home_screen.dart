import 'package:cat_breeds_app/features/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
        ),
      ),
    );
  }
}
