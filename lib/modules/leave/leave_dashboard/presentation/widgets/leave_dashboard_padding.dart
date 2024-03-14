import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class LeaveDashboardPadding extends StatelessWidget {
  const LeaveDashboardPadding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 115,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CircularProgressIndicator(
                        value: 0.8,
                        color: TTColors.primary,
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                  const Positioned(
                    child: Text(
                      '1/4',
                      style: TextStyle(
                        color: TTColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sick_outlined),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Sick Leave',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
