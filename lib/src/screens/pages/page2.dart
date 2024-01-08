import 'package:flutter/material.dart';

import '../../animations/fade_in.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
     return const Center(
      child: FadeInAnimation(delay: 1,
      child: Text('Page 2')),
    );
  }
}