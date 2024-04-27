import 'package:get_it/get_it.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/configuration_system/data/repositories/view_timesheet_report_repository_impl.dart';
import 'package:ts_system/modules/configuration_system/domain/repositories/view_timesheet_report_repository.dart';
import 'package:ts_system/modules/configuration_system/domain/usecases/view_timesheet_report_usecase.dart';
import 'package:ts_system/modules/configuration_system/presentation/bloc/bloc/view_timesheet_bloc.dart';
import 'package:ts_system/modules/dashboard/data/repositories/checkin_repository_impl.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkin_repository.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkout_repository.dart';
import 'package:ts_system/modules/dashboard/domain/usecases/checkin_usecase.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/data/repositories/invite_employee_repository_impl.dart';
import 'package:ts_system/modules/employee/view_employee/data/repositories/view_employee_repository_impl.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/invite_employee_repository.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/view_employee_repository.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/invite_employee_usecases.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/view_employee_usecases.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/leave/apply_leave/data/repositories/apply_leave_repository_impl.dart';
import 'package:ts_system/modules/leave/apply_leave/domain/repositories/apply_leave_repository.dart';
import 'package:ts_system/modules/leave/apply_leave/domain/usecases/apply_leave_usecase.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/bloc/bloc/apply_leave_bloc.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/repositories/fetch_count_repository_impl.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/repositories/fetch_leave_repository_impl.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/repositories/holidays_repository_impl.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_count_repository.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_leave_repository.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/holidays_repository.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_count_usecase.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_leave_usecase.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/hoilday_usecase.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/bloc/bloc/leave_bloc.dart';
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

  // ************ COMMON SERVICE ********************
  // serviceLocator.registerFactory(() => CommonService());

  // ************* SHARED PREFERENCES ****************
  serviceLocator
      .registerSingleton<SharedPreferenceService>(SharedPreferenceService());

  // ************* CUSTOM SNACKBAR ****************
  serviceLocator
      .registerSingleton<CustomSnackBarService>(CustomSnackBarService());

  // ************ Common Service *****************
  serviceLocator.registerSingleton(CommonService());

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
  serviceLocator
      .registerSingleton<UpdateTaskRepository>(UpdateTaskRepositoryImpl());
  serviceLocator
      .registerLazySingleton<UpdateTaskUseCase>(() => UpdateTaskUseCase());

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

  // ************* CHECK IN & OUT ****************
  serviceLocator.registerSingleton<CheckInBloc>(CheckInBloc());
  serviceLocator.registerSingleton<CheckInRepository>(CheckInRepositoryImpl());
  serviceLocator.registerLazySingleton<CheckInUseCase>(() => CheckInUseCase());
  serviceLocator
      .registerSingleton<CheckOutRepository>(CheckOutRepositoryImpl());
  serviceLocator
      .registerLazySingleton<CheckOutUseCase>(() => CheckOutUseCase());

  // ************* APPLY LEAVE ****************
  serviceLocator.registerSingleton<ApplyLeaveBloc>(ApplyLeaveBloc());
  serviceLocator
      .registerSingleton<ApplyLeaveRepository>(ApplyLeaveRepositoryImpl());
  serviceLocator
      .registerLazySingleton<ApplyLeaveUseCase>(() => ApplyLeaveUseCase());

  // ************* FETCH COUNT BY MEMBER ****************
  serviceLocator.registerSingleton<LeaveBloc>(LeaveBloc());
  serviceLocator
      .registerSingleton<FetchCountRepository>(FetchCountRepositoryImpl());
  serviceLocator
      .registerLazySingleton<FetchCountUseCase>(() => FetchCountUseCase());

  // ************* VIEW TIMESHEET REPORT ****************
  serviceLocator.registerSingleton<ViewTimesheetBloc>(ViewTimesheetBloc());
  serviceLocator.registerSingleton<ViewTimesheetReportRepository>(
      ViewTimesheetReportRepositoryImpl());
  serviceLocator.registerLazySingleton<ViewTimesheetReportUseCase>(
      () => ViewTimesheetReportUseCase());

  // ********* HOLIDAYS ******************
  serviceLocator
      .registerSingleton<HolidaysRepository>(HolidaysRepositoryImpl());
  serviceLocator
      .registerLazySingleton<HolidaysUseCase>(() => HolidaysUseCase());

  // ********* FETCH LEAVES BY MEMBER ID ******************
  serviceLocator.registerSingleton<FetchLeavesByMemberIdRepository>(
      FetchLeavesByMemberIdRepositoryImpl());
  serviceLocator.registerLazySingleton<FetchLeavesByMemberIdUseCase>(
      () => FetchLeavesByMemberIdUseCase());

  serviceLocator.registerSingleton<FetchLeaveDetailsRepository>(
      FetchLeaveDetailsRepositoryImpl());
  serviceLocator.registerLazySingleton<FetchLeaveDetailsUseCase>(
      () => FetchLeaveDetailsUseCase());

  serviceLocator
      .registerSingleton<FetchLeavesRepository>(FetchLeavesRepositoryImpl());
  serviceLocator
      .registerLazySingleton<FetchLeavesUseCase>(() => FetchLeavesUseCase());
}
