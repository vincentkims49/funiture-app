import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../animations/fade_in.dart';
import '../screens/pages/details_page.dart';
import '../utils/data.dart';

class AppCard extends StatelessWidget {
  final double h;
  final double w;
  final void Function(int index) handleisAddedToCart;
  final void Function(int index) handleisSelected;
  final void Function(GlobalKey) onClick;
  final List<bool> isAddedToCartList;
  final List<bool> isSelectedList;

  const AppCard({
    super.key,
    required this.h,
    required this.w,
    required this.handleisAddedToCart,
    required this.handleisSelected,
    required this.isAddedToCartList,
    required this.isSelectedList,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: h * .09),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: funitureList.length,
      itemBuilder: (context, index) {
        GlobalKey itemKey =
            GlobalKey(debugLabel: "itemKey${funitureList[index].id}");
        return Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: FadeInAnimation(
            delay: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ProfilePage(
                      index: index,
                    ),
                  ),
                );
              },
              child: Container(
                height: h * .22,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 60,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        key: itemKey,
                        child: Hero(
                          tag: Key('imagetag${funitureList[index].id}'),
                          child: Image.asset(
                            funitureList[index].imagePath,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * .5,
                      height: h * .3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                funitureList[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                funitureList[index].description,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${funitureList[index].price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      onClick(
                                        itemKey,
                                      );
                                    },
                                    icon: Icon(
                                      isAddedToCartList[index]
                                          ? Iconsax.shopping_cart
                                          : Icons.add_shopping_cart,
                                      size: 20,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      handleisSelected(index);
                                      // ignore: avoid_print
                                      print(
                                          "APP_CARD ${isSelectedList[index]}");
                                    },
                                    icon: Icon(
                                      isSelectedList[index]
                                          ? Icons.favorite
                                          : Iconsax.heart,
                                      size: 20,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
