import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';
import 'package:flutter/material.dart';

/// A widget that displays an image from the network.
class NetworkImageLoader extends StatelessWidget {
  /// The URL of the image to load.
  final String imageUrl;

  final double? size;

  final BoxFit fit;

  final BorderRadius? borderRadius;

  const NetworkImageLoader({super.key, required this.imageUrl, this.size, this.fit = BoxFit.cover, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    Widget img = CachedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: fit,
      // Show a placeholder while the image is loading
      placeholder: (_, __) {
        return SizedBox(width: size, height: size, child: const Center(child: CircularProgressIndicator()));
      },
      // Show an error icon if loading fails
      errorWidget: (_, __, ___) {
        return SizedBox(width: size, height: size, child: Center(child: AppIcons.brokenImage));
      },
      fadeInDuration: const Duration(milliseconds: 150),
    );

    // Apply rounded corners if a borderRadius is provided
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: img);
    }

    return img;
  }
}
