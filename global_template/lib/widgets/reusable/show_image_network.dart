import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ShowImageNetwork extends StatelessWidget {
  const ShowImageNetwork({
    @required this.imageUrl,
    this.imageCircleRadius = 35,
    this.imageRadius = 10,
    this.imageSize,
    this.isCircle = false,
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    this.fit,
    this.onErrorImage,
  });

  final String imageUrl;

  ///! Setting size image
  final double imageSize;

  ///! Setting Jika Ingin Image Lingkaran
  final bool isCircle;

  ///! Setting Image Circle Radius
  final double imageCircleRadius;

  ///! Setting Image Circle Radius
  final double imageRadius;

  ///! Setting Padding Image
  final EdgeInsetsGeometry padding;

  ///! Setting Align Image
  final AlignmentGeometry alignment;

  ///! Settings fit Image
  final BoxFit fit;

  ///! Handle Error Image
  final Function(BuildContext context, String url, dynamic error) onErrorImage;

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? 'https://flutter.dev/images/catalog-widget-placeholder.png',
          height: sizes.height(context) / (imageSize ?? double.infinity),
          width: sizes.width(context) / (imageSize ?? double.infinity),
          errorWidget: onErrorImage ??
              (BuildContext context, String url, dynamic error) {
                return Center(
                    child: IconButton(icon: const Icon(Icons.error), onPressed: () => ''));
              },
          placeholder: (context, url) => const CircularProgressIndicator(),
          fit: fit,
          alignment: alignment,
        ),
      ),
    );

    return isCircle
        ? Padding(
            padding: padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: imageCircleRadius,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorPallete.black.withOpacity(.5),
                      blurRadius: 2,
                      offset: const Offset(2, 1),
                    ),
                  ],
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageUrl,
                    ),
                    fit: fit,
                  ),
                ),
              ),
            ),
          )
        : image;
  }
}
