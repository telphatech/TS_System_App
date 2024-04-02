import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/domain/usecases/checkin_usecase.dart';
import 'package:ts_system/utils/components/tt_string.dart';

import 'check_in_event.dart';
import 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  bool? isCheckedIn;
  String? btnName;
  String welcomeMsg = "";
  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();
  CheckInBloc() : super(CheckInInitial()) {
    on<CheckInInitialEvent>(onCheckInInitialEvent);
    on<CheckOutInitialEvent>(onCheckOutInitialEvent);
    // on<ShiftStatusEvent>(onShiftStatusEvent);

    var hours = DateTime.now().hour;
    if (hours < 12) {
      welcomeMsg = 'Good Morning';
    } else if (hours < 17) {
      welcomeMsg = 'Good Afternoon';
    } else {
      welcomeMsg = 'Good Evening';
    }
  }

  FutureOr<void> onCheckInInitialEvent(
      CheckInInitialEvent event, Emitter<CheckInState> emit) async {
    emit(CheckInLoading());
    final repository = serviceLocator<CheckInUseCase>();
    final response = await repository.invoke(event.checkInModel);

    if (response.isLeft) {
      isCheckedIn = false;
      btnName = AppUtils.checkOut;
      emit(CheckInFailure());
    } else {
      try {
        if (response.right["status"] == "success") {
          isCheckedIn = true;
          btnName = AppUtils.checkIn;
          emit(CheckInSuccess(message: "You are checked-in"));
        } else {
          isCheckedIn = false;
          btnName = AppUtils.checkOut;
          emit(CheckInError(message: AppUtils.failedToCheckIn));
        }
      } catch (e) {
        isCheckedIn = false;
        btnName = AppUtils.checkOut;
        emit(CheckInFailure());
      }
    }
  }

  FutureOr<void> onCheckOutInitialEvent(
      CheckOutInitialEvent event, Emitter<CheckInState> emit) async {
    emit(CheckOutLoading());

    final repository = serviceLocator<CheckOutUseCase>();
    final response = await repository.invoke(event.memberId);

    if (response.isLeft) {
      isCheckedIn = true;
      btnName = AppUtils.checkIn;
      emit(CheckOutFailure());
    } else {
      try {
        if (response.right["status"] == "success") {
          isCheckedIn = false;
          btnName = AppUtils.checkOut;
          emit(CheckOutSuccess(message: "You are checked-out"));
        } else {
          isCheckedIn = true;
          btnName = AppUtils.checkIn;
          emit(CheckOutError(message: AppUtils.failedToCheckOut));
        }
      } catch (e) {
        isCheckedIn = true;
        btnName = AppUtils.checkIn;
        emit(CheckInFailure());
      }
    }
  }
}
