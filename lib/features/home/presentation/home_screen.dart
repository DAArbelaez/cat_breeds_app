import 'package:cat_breeds_app/core/constants/app_constants.dart';
import 'package:cat_breeds_app/features/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:cat_breeds_app/features/common/widgets/input_search.dart';
import 'package:cat_breeds_app/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(homeControllerProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Padding(
          padding: kPagePadding,
          child: Center(
            child: Column(children: [
              InputSearch(onSearchChanged: (value) {}, hintText: 'Search for a breed'),
              Text('Welcome to the Home Screen!')]),
          ),
        ),
      ),
    );
  }
}
