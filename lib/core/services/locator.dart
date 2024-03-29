import 'package:get_it/get_it.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/employee/view_employee/data/repositories/invite_employee_repository_impl.dart';
import 'package:ts_system/modules/employee/view_employee/data/repositories/view_employee_repository_impl.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/invite_employee_repository.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/view_employee_repository.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/invite_employee_usecases.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/view_employee_usecases.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/login/employee_registration/data/repositories/employee_register_impl.dart';
import 'package:ts_system/modules/login/employee_registration/domain/repositories/employee_register_repository.dart';
import 'package:ts_system/modules/login/employee_registration/domain/usecases/employee_register_usecase.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/bloc/bloc/employee_register_bloc.dart';
import 'package:ts_system/modules/login/sign_in/data/repositories/invitation_repository_impl.dart';
import 'package:ts_system/modules/login/sign_in/data/repositories/login_repository_impl.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/invitation_repository.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/login_repository.dart';
import 'package:ts_system/modules/login/sign_in/domain/usecases/invitation_usecases.dart';
import 'package:ts_system/modules/login/sign_in/domain/usecases/login_usecases.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_bloc.dart';
import 'package:ts_system/modules/tasks/add_task/data/repositories/add_task_repository_impl.dart';
import 'package:ts_system/modules/tasks/add_task/domain/repositories/add_task_repository.dart';
import 'package:ts_system/modules/tasks/add_task/domain/usecases/add_task_usecase.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/repositories/group_id_repository_impl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/repositories/task_repository_impl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/group_id_repository.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/task_repository.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/usecases/group_id_usecases.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/usecases/task_usecases.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';

final serviceLocator = GetIt.instance;
void initializeDependencies() {
  // ************* AUTO ROUTER ****************
  serviceLocator.registerSingleton<AppRouter>(AppRouter());

  // ************* SHARED PREFERENCES ****************
  serviceLocator
      .registerSingleton<SharedPreferenceService>(SharedPreferenceService());

  // ************* CUSTOM SNACKBAR ****************
  serviceLocator
      .registerSingleton<CustomSnackBarService>(CustomSnackBarService());

  // ************* TASKS ****************
  serviceLocator.registerSingleton<TaskBloc>(TaskBloc());
  serviceLocator.registerSingleton<TaskRepository>(TaskRepositoryImpl());
  serviceLocator.registerLazySingleton<TaskUseCase>(() => TaskUseCase());

  serviceLocator
      .registerSingleton<DeleteTaskRepository>(DeleteTaskRepositoryImpl());
  serviceLocator
      .registerLazySingleton<DeleteTaskUseCase>(() => DeleteTaskUseCase());

  // ************* ADD TASKS ****************
  serviceLocator.registerSingleton<AddTaskBloc>(AddTaskBloc());
  serviceLocator.registerSingleton<AddTaskRepository>(AddTaskRepositoryImpl());
  serviceLocator.registerLazySingleton<AddTaskUseCase>(() => AddTaskUseCase());

  // ************* VIEW EMPLOYEE ****************
  serviceLocator.registerSingleton<ViewEmployeeBloc>(ViewEmployeeBloc());
  serviceLocator
      .registerSingleton<ViewEmployeeRepository>(ViewEmployeeRepositoryImpl());
  serviceLocator
      .registerLazySingleton<ViewEmployeeUseCase>(() => ViewEmployeeUseCase());

  // ************* INVITE EMPLOYEE ****************
  serviceLocator.registerSingleton<InviteEmployeeRepository>(
      InviteEmployeeRepositoryImpl());
  serviceLocator.registerLazySingleton<InviteEmployeeUseCase>(
      () => InviteEmployeeUseCase());

  // ************* Group ****************
  serviceLocator.registerSingleton<GroupRepository>(GroupRepositoryImpl());
  serviceLocator.registerLazySingleton<GroupUseCase>(() => GroupUseCase());

  // ************* Group BY Id ****************
  serviceLocator.registerSingleton<GroupIdRepository>(GroupIdRepositoryImpl());
  serviceLocator.registerLazySingleton<GroupIdUseCase>(() => GroupIdUseCase());

  // ************* LOGIN ****************
  serviceLocator.registerSingleton<LoginBloc>(LoginBloc());
  serviceLocator.registerSingleton<LoginRepository>(LoginRepositoryImpl());
  serviceLocator.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
  serviceLocator
      .registerSingleton<InvitationRepository>(InvitationRepositoryImpl());
  serviceLocator
      .registerLazySingleton<InvitationUseCases>(() => InvitationUseCases());

  // ************* REGISTER EMPLOYEE ****************
  serviceLocator
      .registerSingleton<EmployeeRegisterBloc>(EmployeeRegisterBloc());
  serviceLocator.registerSingleton<EmployeeRegisterRepository>(
      EmployeeRegisterRepositoryImpl());
  serviceLocator.registerLazySingleton<EmployeeRegisterUseCase>(
      () => EmployeeRegisterUseCase());
}
