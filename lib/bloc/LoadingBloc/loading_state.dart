part of 'loading_bloc.dart';

abstract class LoadingBlocState extends Equatable {
  const LoadingBlocState();

  @override
  List<Object> get props => [];
}

class LoadingInitial extends LoadingBlocState {}

class ProccesingState extends LoadingBlocState {}

class BoookingListLoadedState extends LoadingBlocState {
  final List bookedList;
  final List pendingList;

  BoookingListLoadedState({@required this.bookedList, @required this.pendingList});

  @override
  List<Object> get props => [bookedList, pendingList];
}

class FreeRoomsLoadedState extends LoadingBlocState {
  final List rooms;

  FreeRoomsLoadedState({@required this.rooms});

  @override
  List<Object> get props => [rooms];
}

class RoomConfirmedState extends LoadingBlocState {}

class RoomConfirmedFailedState extends LoadingBlocState {}

class BookCancelledState extends LoadingBlocState {}

class BookCancelledFailedState extends LoadingBlocState {}

class CheckInConfirmedState extends LoadingBlocState {}

class CheckInFailedState extends LoadingBlocState {}

class CheckOutConfirmedState extends LoadingBlocState {}

class CheckOutFailedState extends LoadingBlocState {}

class GuestsLoadedState extends LoadingBlocState {
  final List loadedGuests;

  GuestsLoadedState({@required this.loadedGuests});

  @override
  List<Object> get props => [loadedGuests];
}

class LoadedRoomsBookingsState extends LoadingBlocState {
  final List bookings;

  LoadedRoomsBookingsState({@required this.bookings});

  @override
  List<Object> get props => [bookings];
}
