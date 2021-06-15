part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadingInitial extends LoadingState {}

class ProccesingState extends LoadingState {}

class BoookingListLoadedState extends LoadingState {
  final List bookedList;
  final List pendingList;

  BoookingListLoadedState({@required this.bookedList, @required this.pendingList});

  @override
  List<Object> get props => [bookedList, pendingList];
}
