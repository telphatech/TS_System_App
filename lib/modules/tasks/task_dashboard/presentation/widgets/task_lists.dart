import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          itemCount: 50,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: TTColors.white,
                        border: Border.all(width: 5, color: TTColors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.task,
                              size: 20, color: TTColors.primary),
                          UIHelpers.horizontalSpaceTiny,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectionColor: TTColors.primary,
                                  "Working on Tasks",
                                  style: TTypography.normal
                                      .copyWith(color: TTColors.primary),
                                ),
                                Text(
                                  "Flutter Creators (V86)",
                                  style: TTypography.normal.copyWith(
                                      color: TTColors.black, fontSize: 14),
                                  overflow: TextOverflow.clip,
                                ),
                                UIHelpers.verticalSpaceMedium,
                                Text("09:00 AM - 12:00 PM",
                                    style: TTypography.normal.copyWith(
                                        fontSize: 14,
                                        color: TTColors.black,
                                        fontWeight: FontWeight.bold)),
                                UIHelpers.verticalSpaceSmall,
                                Text("2 Hrs 20 mins",
                                    style: TTypography.normal.copyWith(
                                        fontSize: 14,
                                        color: TTColors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
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
