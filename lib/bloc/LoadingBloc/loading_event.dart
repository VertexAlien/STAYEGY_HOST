part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class LoadBookings extends LoadingEvent {}

class LoadFreeRoomsEvent extends LoadingEvent {
  final BookDetails bookDetails;

  LoadFreeRoomsEvent({@required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class ConfirmBookEvent extends LoadingEvent {
  final BookDetails bookDetails;

  ConfirmBookEvent({@required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class CancelBookEvent extends LoadingEvent {
  final BookDetails bookDetails;

  CancelBookEvent({@required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class ConfirmCheckInEvent extends LoadingEvent {
  final BookDetails bookDetails;

  ConfirmCheckInEvent({@required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class ConfirmCheckOutEvent extends LoadingEvent {
  final BookDetails bookDetails;

  ConfirmCheckOutEvent({@required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class LoadGuestsEvent extends LoadingEvent {}

class LoadRoomsBookingsEvent extends LoadingEvent {
  final String roomNo;

  LoadRoomsBookingsEvent({@required this.roomNo});

  @override
  List<Object> get props => [roomNo];
}
