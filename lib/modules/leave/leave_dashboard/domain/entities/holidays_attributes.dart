import 'package:equatable/equatable.dart';

class HolidaysAttributesItems extends Equatable {
  final String? holidayId;
  final String? holidayOccasion;
  final DateTime? holidayDate;

  const HolidaysAttributesItems({
    this.holidayId,
    this.holidayOccasion,
    this.holidayDate,
  });

  @override
  List<Object?> get props => [
        holidayId,
        holidayOccasion,
        holidayDate,
      ];
}
