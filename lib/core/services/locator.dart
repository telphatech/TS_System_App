import 'package:get_it/get_it.dart';
import 'package:ts_system/config/router/app_router.dart';

final serviceLocator = GetIt.instance;
void initializeDependencies() {
  serviceLocator.registerSingleton<AppRouter>(AppRouter());

  // Categories
  // serviceLocator.registerSingleton<HomeBloc>(HomeBloc());
  // serviceLocator
  //     .registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  // serviceLocator
  //     .registerLazySingleton<CategoriesUseCases>(() => CategoriesUseCases());

  // serviceLocator.registerSingleton<PostersRepository>(PostersRepositoryImpl());
  // serviceLocator
  //     .registerLazySingleton<PostersUseCases>(() => PostersUseCases());

  // serviceLocator
  //     .registerSingleton<MessDetailsRepository>(MessDetailsRepositoryImpl());
  // serviceLocator
  //     .registerLazySingleton<MessDetailsUseCases>(() => MessDetailsUseCases());
}
