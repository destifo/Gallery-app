import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/data/models/image_meta.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.image});

  final ImageMeta image;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: image.downloadUrl,
                  )),
            ),
            Text("Author: ${image.author}"),
            Text("Width: ${image.width}"),
            Text("Height: ${image.height}")
          ],
        ),
      ),
    );
  }
}
