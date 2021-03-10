import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommonCarouselSlider {
  static Widget customCarouselSlider(List<Widget> items) {
    return new CarouselSlider(
      items: items,
      options: CarouselOptions(
          height: 220.0,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal),
    );
  }
}
