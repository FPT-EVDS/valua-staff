import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const CachedCircleAvatar({
    Key? key,
    this.imageUrl,
    this.radius = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl != null
            ? imageUrl.toString()
            : 'https://ussecuritysupply.com/wp-content/uploads/2013/05/default_avatar.png',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: radius,
        ),
      ),
    );
  }
}
