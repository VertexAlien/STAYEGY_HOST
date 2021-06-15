import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookRepository.dart';
import 'package:stayegy_host/constants/constant.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  final BookRepository _bookRepository;

  LoadingBloc({@required BookRepository bookRepository})
      : assert(bookRepository != null),
        _bookRepository = bookRepository,
        super(LoadingInitial());

  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if (event is LoadBookings) {
      yield ProccesingState();

      List bookList = [];
      List pendingList = [];

      bookList = await _bookRepository.getBookedList();
      pendingList = await _bookRepository.getPendingList();

      yield BoookingListLoadedState(bookedList: bookList, pendingList: pendingList);
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
