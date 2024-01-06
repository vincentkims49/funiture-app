import 'package:flutter/material.dart';

import '../animations/fade_in.dart';
import '../utils/data.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.h,
  });

  final double h;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedIdx = 0;

  void handleSelect(int index) {
    setState(() {
      selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h * .04,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: categoryList.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    handleSelect(index);
                  },
                  child: FadeInAnimation(
                    delay: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AnimatedContainer(
                        duration:const Duration( milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedIdx == index
                              ? Colors.deepPurple
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4, left: 4),
                          child: Center(
                            child: Text(
                              categoryList[index].title,
                              style: TextStyle(
                                fontWeight: selectedIdx == index
                                    ? FontWeight.bold
                                    : null,
                                color: selectedIdx == index
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
