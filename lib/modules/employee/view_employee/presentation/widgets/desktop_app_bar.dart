import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_bloc.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_event.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_state.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class AppBarDesktopWidget extends StatelessWidget {
  const AppBarDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckInBloc(),
      child: BlocConsumer<CheckInBloc, CheckInState>(
        listener: (context, state) {
          if (state is CheckInSuccess) {
            serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
              context,
              message: state.message,
            );
          } else if (state is CheckInError) {
            serviceLocator<CustomSnackBarService>().showInfoSnackBar(
              context,
              message: state.message,
            );
          } else if (state is CheckInFailure) {
            serviceLocator<CustomSnackBarService>().showWarningSnackBar(
              context,
              message: AppUtils.failedToCheckIn,
            );
          } else if (state is CheckOutSuccess) {
            serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
              context,
              message: state.message,
            );
          } else if (state is CheckOutError) {
            serviceLocator<CustomSnackBarService>().showErrorSnackBar(
              context,
              message: state.message,
            );
          } else if (state is CheckOutFailure) {
            serviceLocator<CustomSnackBarService>().showWarningSnackBar(
              context,
              message: AppUtils.failedToCheckOut,
            );
          }
        },
        builder: (context, state) {
          return AppBar(
            backgroundColor: TTColors.primary,
            iconTheme: const IconThemeData(color: TTColors.white),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                    width: UIHelpers.screenWidth(context) * 0.10,
                    child: CustomElevatedButton(
                        backgroundColor:
                            serviceLocator<SharedPreferenceService>()
                                    .isCheckedIn
                                ? TTColors.accent
                                : TTColors.primary,
                        borderColor: serviceLocator<SharedPreferenceService>()
                                .isCheckedIn
                            ? TTColors.accent
                            : TTColors.white,
                        iconColor: TTColors.white,
                        iconData: serviceLocator<SharedPreferenceService>()
                                .isCheckedIn
                            ? Icons.logout
                            : Icons.login,
                        onPressed: () {
                          BlocProvider.of<CheckInBloc>(context).add(
                              serviceLocator<SharedPreferenceService>()
                                      .isCheckedIn
                                  ? CheckOutInitialEvent(
                                      memberId: BlocProvider.of<CheckInBloc>(
                                              context,
                                              listen: false)
                                          .sharedPreferenceService
                                          .empID)
                                  : CheckInInitialEvent(
                                      checkInModel: CheckInModel(
                                          attDate: DateTime.now(),
                                          attMemberId:
                                              BlocProvider.of<CheckInBloc>(
                                                      context,
                                                      listen: false)
                                                  .sharedPreferenceService
                                                  .empID)));
                        },
                        child: BlocBuilder<CheckInBloc, CheckInState>(
                          builder: (context, state) {
                            if (state is CheckInLoading ||
                                state is CheckOutLoading) {
                              return LoadingAnimationWidget
                                  .horizontalRotatingDots(
                                color: TTColors.white,
                                size: UIHelpers.screenWidth(context) * 0.05,
                              );
                            } else if (state is CheckInSuccess) {
                              return const Text(AppUtils.checkOut);
                            } else if (state is CheckOutSuccess) {
                              return const Text(AppUtils.checkIn);
                            }
                            return Text(
                                serviceLocator<SharedPreferenceService>()
                                        .isCheckedIn
                                    ? AppUtils.checkOut
                                    : AppUtils.checkIn);
                          },
                        ))),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: TTColors.white)),
                child: Row(
                  children: [
                    const Icon(Icons.person, color: TTColors.white),
                    UIHelpers.horizontalSpaceTiny,
                    AppText.body(
                        Provider.of<CommonService>(context)
                            .sharedPreferenceService
                            .name,
                        color: TTColors.white),
                    PopupMenuButton<String>(
                      position: PopupMenuPosition.under,
                      elevation: 0,
                      tooltip: 'Profile',
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: TTColors.white),
                      onSelected: (value) {
                        if (value == 'dashboard') {
                        } else if (value == 'logout') {}
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          value: 'dashboard',
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.dashboard,
                                      color: TTColors.primary),
                                  SizedBox(width: 10),
                                  Text('Dashboard',
                                      style: TextStyle(color: TTColors.black)),
                                ],
                              ),
                              UIHelpers.listDividerWhite,
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'color',
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: TTColors.accent,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: TTColors.warning,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: TTColors.success,
                                  ),
                                ],
                              ),
                              UIHelpers.listDividerWhite,
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'logout',
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: TTColors.primary),
                              SizedBox(width: 10),
                              Text('Logout',
                                  style: TextStyle(color: TTColors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
