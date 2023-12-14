import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/data/models/image_meta.dart';
import 'package:gallery_app/presentation/widgets/image_detail.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});
  final ImageMeta image;

  void openDialog(BuildContext ctx) {
    showGeneralDialog(
        transitionDuration: const Duration(milliseconds: 200),
        context: ctx,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) => ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1).animate(a1),
              child: AlertDialog(
                content: ImageDetail(image: image),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openDialog(context);
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Card(
            child: AspectRatio(
              aspectRatio: (image.height / image.width) * (1.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: image.downloadUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )),
    );
  }
}
