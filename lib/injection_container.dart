import 'package:get_it/get_it.dart';
import 'package:image_feed_app/features/data/datasource/image_datasource/image_local_datasource.dart';
import 'package:image_feed_app/features/data/repository_impl/image_repository_impl/image_repository_impl.dart';
import 'package:image_feed_app/features/domain/repositories/image_feed_repository/image_repository.dart';
import 'package:image_feed_app/features/presentation/pages/Image_feed_screens/bloc/image_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ImageLocalDataSource>(
    () => ImageLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(sl()));

  sl.registerFactory(() => ImageBloc(sl()));
}
