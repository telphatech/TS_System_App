import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_bloc.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_event.dart';
import 'package:ts_system/modules/dashboard/presentation/bloc/bloc/check_in_state.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/count_container.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/home_app_bar.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class DashboardMobileView extends StatefulWidget {
  const DashboardMobileView({super.key});

  @override
  State<DashboardMobileView> createState() => _DashboardMobileViewState();
}

class _DashboardMobileViewState extends State<DashboardMobileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckInBloc(),
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: HomeAppBar()),
        drawer: const MenuDrawer(),
        body: BlocConsumer<CheckInBloc, CheckInState>(
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelpers.verticalSpaceSmall,
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: TTColors.white,
                        backgroundImage: AssetImage(TTIcons.profilePic),
                      ),
                      title: AppText.body5(
                        BlocProvider.of<CheckInBloc>(context, listen: false)
                            .welcomeMsg,
                      ),
                      subtitle: AppText.bodyBold2(
                        BlocProvider.of<CheckInBloc>(context, listen: false)
                            .sharedPreferenceService
                            .name,
                        isSingleLined: true,
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: AppText.bodyBold2(
                        "Let's start with the work",
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                            backgroundColor:
                                serviceLocator<SharedPreferenceService>()
                                        .isCheckedIn
                                    ? TTColors.accent
                                    : TTColors.primary,
                            borderColor:
                                serviceLocator<SharedPreferenceService>()
                                        .isCheckedIn
                                    ? TTColors.accent
                                    : TTColors.primary,
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
                                          memberId:
                                              BlocProvider.of<CheckInBloc>(
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
                                    size: UIHelpers.screenWidth(context) * 0.15,
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
                    UIHelpers.verticalSpaceMedium,
                    CountContainer(
                      title: 'Leave Used',
                      month: DateTime.now(),
                      count: '2',
                      total: '50',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
