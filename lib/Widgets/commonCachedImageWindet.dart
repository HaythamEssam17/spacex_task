import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'commonSpinKit.dart';

class CommonCachedImaeWidget {
  static Widget cachedImage(
      BuildContext context, String imageUrl, double height, double width) {
    // String image = imageUrl.length == 0
    //     ? 'https://media.timeout.com/images/105473507/image.jpg'
    //     : imageUrl;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      placeholder: (context, img) => Container(
          height: height,
          width: width,
          child: CommonSpinKit.customSpinKitRing()),
      errorWidget: (context, url, error) => ClipOval(
        child: Image.asset(
          'images/logo.jpg',
          fit: BoxFit.fill,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
