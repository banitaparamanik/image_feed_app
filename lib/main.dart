import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_feed_app/features/presentation/pages/Image_feed_screens/bloc/image_bloc.dart';
import 'package:image_feed_app/features/presentation/pages/Image_feed_screens/image_feed_page.dart';

import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ImageBloc>()..add(LoadImages()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const ImageFeedPage(),
      ),
    );
  }
}
