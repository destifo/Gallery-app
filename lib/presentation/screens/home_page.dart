import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_app/data/models/image_meta.dart';
import 'package:gallery_app/presentation/bloc/image_bloc.dart';
import 'package:gallery_app/presentation/bloc/image_states.dart';
import 'package:gallery_app/presentation/widgets/image_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Widget> getCards(List<ImageMeta> images) {
    return images.map((e) => ImageCard(image: e)).toList();
  }

  Widget getGridView(List<ImageMeta> images, BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: images.length,
        padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
        itemBuilder: (context, index) {
          return ImageCard(image: images[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          print(state);
          if (state is LoadingImages) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ImagesLoaded) {
            var images = state.images.sublist(12).reversed.toList();
            return getGridView(images, context);
          }

          return const Center(
            child: Text("Error Loading images"),
          );
        },
      ),
    );
  }
}
