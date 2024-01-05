import 'package:gallery_app/features/gallery/data/models/image_meta.dart';

abstract class ImageState {}

class ImagesLoaded implements ImageState {
  final List<ImageMeta> images;
  ImagesLoaded({required this.images});
}

class LoadingImages implements ImageState {}

class ImagesError implements ImageState {}
