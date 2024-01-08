import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  int count = 1;
  bool isSelectedHeart = false;
  int selectedColor = 0;
  int total = 0;

  void addCount() {
    setState(() {
      count = count + 1;

      total = count * int.parse(funitureList[widget.index].price);
    });
  }

  void minusCount() {
    setState(() {
      count == 1 ? count = count - 0 : count = count - 1;
      total = count * int.parse(funitureList[widget.index].price);
    });
  }

  void handleisSelected(int index) {
    setState(() {
      selectedColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * .5,
            child: Hero(
              tag: Key("imagetag${funitureList[widget.index].id}"),
              child: Image.asset(
                funitureList[widget.index].imagePath,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 100,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            funitureList[widget.index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          AwesomeStarRating(
                            starCount: 5,
                            rating: 3.5,
                            size: h * 0.02,
                            color: Colors.deepPurple,
                            borderColor: Colors.deepPurple,
                            allowHalfRating: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      Text(
                        funitureList[widget.index].detailedDescription,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Color",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              SizedBox(
                                width: w * .4,
                                height: h * .035,
                                child: ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    List<Color> circleColors = [
                                      Colors.blue,
                                      Colors.green,
                                      Colors.red
                                    ];

                                    return GestureDetector(
                                      onTap: () {
                                        handleisSelected(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            color: selectedColor == index
                                                ? Colors.black
                                                : Colors.transparent,
                                          ),
                                        ),
                                        width: w * .075,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: circleColors[index],
                                            ),
                                            width: 15,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: h * .05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    minusCount();
                                  },
                                  icon: const Icon(Iconsax.minus),
                                ),
                                Text(count.toString()),
                                IconButton(
                                  onPressed: () {
                                    addCount();
                                  },
                                  icon: const Icon(Iconsax.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "\$ ${total == 0 ? total = int.parse(funitureList[widget.index].price) : total.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.shopping_cart,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
