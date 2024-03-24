import 'package:get_it/get_it.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/modules/login/sign_in/data/repositories/login_repository_impl.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/login_repository.dart';
import 'package:ts_system/modules/login/sign_in/domain/usecases/login_usecases.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/repositories/task_repository_impl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/task_repository.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/usecases/task_usecases.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';

final serviceLocator = GetIt.instance;
void initializeDependencies() {
  serviceLocator.registerSingleton<AppRouter>(AppRouter());

  // Tasks
  serviceLocator.registerSingleton<TaskBloc>(TaskBloc());
  serviceLocator.registerSingleton<TaskRepository>(TaskRepositoryImpl());
  serviceLocator.registerLazySingleton<TaskUseCase>(() => TaskUseCase());

  // Login
  serviceLocator.registerSingleton<LoginBloc>(LoginBloc());
  serviceLocator.registerSingleton<LoginRepository>(LoginRepositoryImpl());
  serviceLocator.registerLazySingleton<LoginUseCase>(() => LoginUseCase());

  // serviceLocator.registerSingleton<PostersRepository>(PostersRepositoryImpl());
  // serviceLocator
  //     .registerLazySingleton<PostersUseCases>(() => PostersUseCases());

  // serviceLocator
  //     .registerSingleton<MessDetailsRepository>(MessDetailsRepositoryImpl());
  // serviceLocator
  //     .registerLazySingleton<MessDetailsUseCases>(() => MessDetailsUseCases());
}
