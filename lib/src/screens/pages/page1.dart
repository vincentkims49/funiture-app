import 'package:flutter/material.dart';
import 'package:funiture_store/src/animations/fade_in.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FadeInAnimation(delay: 1,
      child: Text('Page 1')),
    );
  }
}