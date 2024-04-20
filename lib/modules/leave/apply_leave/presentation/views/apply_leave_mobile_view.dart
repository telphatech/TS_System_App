import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/bloc/bloc/apply_leave_bloc.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ApplyLeaveMobileView extends StatefulWidget {
  const ApplyLeaveMobileView({super.key});

  @override
  ApplyLeaveMobileViewState createState() => ApplyLeaveMobileViewState();
}

class ApplyLeaveMobileViewState extends State<ApplyLeaveMobileView> {
  DateTime? fromDate;
  DateTime? toDate;
  bool leaveType = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyLeaveBloc(),
      child: BlocConsumer<ApplyLeaveBloc, ApplyLeaveState>(
        listener: (context, state) {
          if (state is ApplyLeaveError) {
            serviceLocator<CustomSnackBarService>().showWarningSnackBar(
              context,
              message: state.responseAttributesItems?.message ?? "",
            );
          } else if (state is ApplyLeaveSuccess) {
            serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
              context,
              message: state.responseAttributesItems?.message ?? "",
            );
          } else if (state is ApplyLeaveFailure) {
            serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
              context,
              message: AppUtils.somethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          String calculateDuration() {
            final fromDateText = BlocProvider.of<ApplyLeaveBloc>(context)
                .fromDateController
                .text;
            final toDateText =
                BlocProvider.of<ApplyLeaveBloc>(context).toDateController.text;

            if (fromDateText.isEmpty || toDateText.isEmpty) {
              return '0 days';
            }

            final fromDate = DateTime.parse(fromDateText);
            final toDate = DateTime.parse(toDateText);

            final difference = toDate.difference(fromDate).inDays + 1;
            return '$difference days';
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: TTColors.primary,
              title: Text(
                'Apply Leave',
                style: TTypography.h1.copyWith(color: TTColors.white),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: BlocProvider.of<ApplyLeaveBloc>(context).key,
                    child: Column(
                      children: [
                        CustomSearchDropdown(
                          items: BlocProvider.of<ApplyLeaveBloc>(context)
                              .leaveTypeList,
                          title: 'Leave Type',
                          validator: (value) {
                            if (value == "" ||
                                value == "Select" ||
                                value == null) {
                              return "* Required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              leaveType = true;
                              BlocProvider.of<ApplyLeaveBloc>(context)
                                  .selectedLeaveType = value;
                            });
                          },
                          showSearchBox: false,
                          isMenu: true,
                        ),
                        UIHelpers.verticalSpaceRegular,
                        AppInputField(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              builder: (BuildContext context, Widget? child) =>
                                  Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: TTColors.primary,
                                  hintColor: TTColors.primary,
                                  colorScheme: const ColorScheme.light(
                                    primary: TTColors.primary,
                                  ),
                                ),
                                child: child!,
                              ),
                              context: context,
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2025),
                              firstDate: DateTime.now(),
                            );

                            if (picked != null) {
                              setState(() {
                                BlocProvider.of<ApplyLeaveBloc>(context)
                                        .fromDateController
                                        .text =
                                    DateFormat("yyyy-MM-dd").format(picked);
                              });
                            }
                          },
                          label: 'From Date',
                          readOnly: true,
                          controller: BlocProvider.of<ApplyLeaveBloc>(context)
                              .fromDateController,
                          //enabled: leaveType == true ? true : false,
                          hint: 'Select',
                          trailing: const Icon(
                            Icons.calendar_month_rounded,
                            color: TTColors.primary,
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "* Required";
                            }

                            return null;
                          },
                        ),
                        UIHelpers.verticalSpaceRegular,
                        AppInputField(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              builder: (BuildContext context, Widget? child) =>
                                  Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: TTColors.primary,
                                  hintColor: TTColors.primary,
                                  colorScheme: const ColorScheme.light(
                                    primary: TTColors.primary,
                                  ),
                                ),
                                child: child!,
                              ),
                              context: context,
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2025),
                              firstDate: DateTime.now(),
                            );

                            if (picked != null) {
                              setState(() {
                                BlocProvider.of<ApplyLeaveBloc>(context)
                                        .toDateController
                                        .text =
                                    DateFormat("yyyy-MM-dd").format(picked);
                              });
                            }
                          },
                          label: 'To Date',
                          controller: BlocProvider.of<ApplyLeaveBloc>(context)
                              .toDateController,
                          hint: 'Select',
                          readOnly: true,
                          //enabled: leaveType == true ? true : false,
                          trailing: const Icon(
                            Icons.calendar_month_rounded,
                            color: TTColors.primary,
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "* Required";
                            }

                            return null;
                          },
                        ),
                        UIHelpers.verticalSpaceRegular,
                        AppInputField(
                          label: 'Reason',
                          maxLines: 5,
                          controller: BlocProvider.of<ApplyLeaveBloc>(context)
                              .reasonController,
                          validator: (value) {
                            if (value == "") {
                              return "* Required";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  UIHelpers.verticalSpaceSmall,
                  Text(
                    'Duration: ${calculateDuration()}',
                    style: TTypography.text16Black
                        .copyWith(color: TTColors.primary),
                  ),
                  UIHelpers.verticalSpaceRegular,
                  CustomElevatedButton(
                      onPressed: () {
                        if (BlocProvider.of<ApplyLeaveBloc>(context)
                                .key
                                .currentState
                                ?.validate() ==
                            true) {
                          BlocProvider.of<ApplyLeaveBloc>(context)
                              .add(ApplyLeaveInitialEvent(
                            fromDate: fromDate,
                            toDate: toDate,
                          ));
                        } else {
                          serviceLocator<CustomSnackBarService>()
                              .showWarningSnackBar(context,
                                  message: "Please provide all fields.");
                        }
                      },
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconColor: TTColors.white,
                      child: const Text(
                        'Apply Leave',
                        style: TextStyle(color: TTColors.white),
                      )),
                  UIHelpers.verticalSpaceRegular,
                  CustomElevatedButton(
                      onPressed: () {
                        serviceLocator<AppRouter>()
                            .replace(const LeaveDashboard());
                      },
                      backgroundColor: TTColors.white,
                      borderColor: TTColors.primary,
                      iconColor: TTColors.primary,
                      child: const Text(
                        'Discard',
                        style: TextStyle(color: TTColors.primary),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
