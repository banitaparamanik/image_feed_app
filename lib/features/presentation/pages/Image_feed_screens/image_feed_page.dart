import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_feed_app/features/presentation/pages/Image_feed_screens/bloc/image_bloc.dart';
import 'package:image_feed_app/features/presentation/widgets/dynamic_image_card.dart';
import 'package:image_feed_app/features/presentation/widgets/fixed_image_card.dart';

class ImageFeedPage extends StatelessWidget {
  const ImageFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Feed"),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_vert),
            onPressed: () => context.read<ImageBloc>().add(ToggleLayout()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ImageBloc>().add(PickImages()),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: true,
            addSemanticIndexes: false,
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              final image = state.images[index];

              if (state.layout == FeedLayout.fixed) {
                return FixedImageCard(image: image);
              } else {
                return DynamicImageCard(image: image);
              }
            },
          );
        },
      ),
    );
  }
}
