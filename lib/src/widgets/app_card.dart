import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../animations/fade_in.dart';
import '../screens/pages/details_page.dart';
import '../utils/data.dart';

// ignore: must_be_immutable
class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  @override
  State<AppCard> createState() => AppCardState();
}




class AppCardState extends State<AppCard> {
  List<bool> isSelectedList = List.filled(
    funitureList.length,
    false,
  );

  void handleisSelected(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: widget.h * .08),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: funitureList.length,
      itemBuilder: (context, index) {
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
                height: widget.h * .2,
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
                      child: Hero(
                        tag: Key('imagetag${funitureList[index].id}'),
                        child: Image.asset(
                          funitureList[index].imagePath,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.w * .5,
                      height: widget.h * .3,
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
                              IconButton(
                                onPressed: () {
                                  handleisSelected(index);
                                  // ignore: avoid_print
                                  print("APP_CARD ${isSelectedList[index]}");
                                },
                                icon: Icon(
                                  isSelectedList[index]
                                      ? Icons.favorite
                                      : Iconsax.heart,
                                  size: 20,
                                  color: Colors.deepPurple,
                                ),
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
