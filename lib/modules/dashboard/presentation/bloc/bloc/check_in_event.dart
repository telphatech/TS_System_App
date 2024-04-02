import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';

abstract class CheckInEvent {}

class CheckInInitialEvent extends CheckInEvent {
  CheckInModel checkInModel;
  CheckInInitialEvent({required this.checkInModel});
}

class CheckOutInitialEvent extends CheckInEvent {
  String memberId;
  CheckOutInitialEvent({required this.memberId});
}

class ShiftStatusEvent extends CheckInEvent {}
