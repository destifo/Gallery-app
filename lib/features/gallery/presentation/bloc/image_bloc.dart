import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/gallery/data/datasource/gallery_remote_data_source.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/image_events.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/image_states.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final GalleryRemoteDataSource repo = GalleryRemoteDataSource();

  ImageBloc(super.initialState) {
    on<LoadImages>(_onLoadImages);
  }

  void _onLoadImages(LoadImages event, Emitter<ImageState> emit) async {
    try {
      emit(LoadingImages());
      var images = await repo.getImages();
      emit(ImagesLoaded(images: images));
    } catch (ex) {
      emit(ImagesError());
    }
  }
}
