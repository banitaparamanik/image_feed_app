import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_feed_app/features/presentation/pages/Image_feed_screens/bloc/image_bloc.dart';
import 'package:image_feed_app/features/presentation/widgets/dynamic_image_card.dart';
import 'package:image_feed_app/features/presentation/widgets/fixed_image_card.dart';

class ImageFeedPage extends StatelessWidget {
  const ImageFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktopWidth = constraints.maxWidth >= 800;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Image Feed'),
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

              // For desktop width, show grid; else list
              if (isDesktopWidth) {
                return GridView.builder(
                  padding: const EdgeInsets.all(24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // or 3 depending on width
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: state.images.length,
                  itemBuilder: (context, index) {
                    final image = state.images[index];
                    // You can choose fixed vs dynamic based on state.layout
                    return state.layout == FeedLayout.fixed
                        ? FixedImageCard(image: image)
                        : DynamicImageCard(image: image);
                  },
                );
              } else {
                // mobile or small width fallback: use ListView
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  addSemanticIndexes: false,
                  itemCount: state.images.length,
                  itemBuilder: (context, index) {
                    final image = state.images[index];
                    return state.layout == FeedLayout.fixed
                        ? FixedImageCard(image: image)
                        : DynamicImageCard(image: image);
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
