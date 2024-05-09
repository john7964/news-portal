import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperLinePagination extends SwiperPlugin {
  final EdgeInsets margin;

  SwiperLinePagination(this.margin);

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Container(
      margin: margin,
      height: 4,
      child: Row(
        children: List.generate(
          config.itemCount * 2 - 1,
          (index) {
            if (index % 2 == 0) {
              var target = index / 2;
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: config.activeIndex == target
                          ? Colors.white
                          : const Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(2)),
                ),
              );
            } else {
              return const SizedBox(width: 5);
            }
          },
        ),
      ),
    );
  }
}
