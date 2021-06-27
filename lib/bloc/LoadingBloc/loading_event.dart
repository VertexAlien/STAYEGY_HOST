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
