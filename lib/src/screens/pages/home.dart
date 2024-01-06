import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../animations/fade_in.dart';
import '../../widgets/app_card.dart';
import '../../widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

   
    return Scaffold(
      
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          
          children: [
            const SizedBox(height: 30),
            FadeInAnimation(
              delay: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                Colors.deepPurple, BlendMode.srcIn),
                            child: SvgPicture.asset(
                              "assets/icons/menu-scale.svg",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          const Text(
                            "WELCOME!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onLongPress: () {
                          log('triggered');
                        },
                        onTap: () {},
                        child: SizedBox(
                          height: 60,
                          width: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.withOpacity(.5),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Iconsax.shopping_cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "RedWoods Funiture Store,",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Get best and longterm funitures from us",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            CategoryWidget(
              h: h,
            ),
            AppCard(h: h, w: w),
          ],
        ),
      ),
    );
  }
}
