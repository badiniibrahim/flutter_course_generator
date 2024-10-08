import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final Widget widget;

  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return widget;
      },
      errorWidget: (context, url, error) => Container(
        width: 180,
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/not-found.png'),
          ),
        ),
      ),
    );
  }
}
