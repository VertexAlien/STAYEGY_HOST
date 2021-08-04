import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stayegy_host/bloc/Notificaions/Notification.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookRepository.dart';
import 'package:stayegy_host/constants/constant.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingBlocState> {
  final BookRepository _bookRepository;

  LoadingBloc({@required BookRepository bookRepository})
      : assert(bookRepository != null),
        _bookRepository = bookRepository,
        super(LoadingInitial());

  @override
  Stream<LoadingBlocState> mapEventToState(LoadingEvent event) async* {
    if (event is LoadBookings) {
      yield ProccesingState();

      List bookList = [];
      List pendingList = [];

      bookList = await _bookRepository.getBookedList();
      pendingList = await _bookRepository.getPendingList();

      yield BoookingListLoadedState(bookedList: bookList, pendingList: pendingList);
    } else if (event is LoadFreeRoomsEvent) {
      yield ProccesingState();

      List freeRooms = [];

      freeRooms = await _bookRepository.getFreeRooms(event.bookDetails);

      print(freeRooms);

      yield FreeRoomsLoadedState(rooms: freeRooms);
    } else if (event is ConfirmBookEvent) {
      yield ProccesingState();

      if (await _bookRepository.confirmBooking(event.bookDetails)) {
        yield RoomConfirmedState();
      } else {
        yield RoomConfirmedFailedState();
      }
    } else if (event is CancelBookEvent) {
      yield ProccesingState();

      if (await _bookRepository.cancelBooking(event.bookDetails)) {
        yield BookCancelledState();
      } else {
        yield BookCancelledFailedState();
      }
    } else if (event is ConfirmCheckInEvent) {
      yield ProccesingState();

      if (await _bookRepository.congirmCheckIn(event.bookDetails)) {
        yield CheckInConfirmedState();
      } else {
        yield CheckInFailedState();
      }
    } else if (event is LoadGuestsEvent) {
      yield ProccesingState();

      List guestsList = await _bookRepository.getGuestsList();

      yield GuestsLoadedState(loadedGuests: guestsList);
    } else if (event is LoadRoomsBookingsEvent) {
      yield ProccesingState();

      List bookings = await _bookRepository.getBookingsbyRoomNo(event.roomNo);

      yield LoadedRoomsBookingsState(bookings: bookings);
    } else if (event is ConfirmCheckOutEvent) {
      yield ProccesingState();

      if (await _bookRepository.confirmCheckOut(event.bookDetails)) {
        yield CheckOutConfirmedState();
      } else {
        yield CheckOutFailedState();
      }
    }
  }

  @override
  void onEvent(LoadingEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }

  @override
  Future<void> close() {
    print('Bloc Closed');
    return super.close();
  }
}
