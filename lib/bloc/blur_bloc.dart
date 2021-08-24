import 'dart:async';

import 'package:bank_app/model/transaction.dart';
import 'package:bank_app/repo/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blur_event.dart';
part 'blur_state.dart';

class BlurBloc extends Bloc<BlurEvent, BlurState> {
  Repository repository = Repository();
  List<Transaction> transactions = [];
  BlurBloc() : super(Loading());

  @override
  Stream<BlurState> mapEventToState(
    BlurEvent event,
  ) async* {
    if (event is AppStart) {
      try {
        transactions =
            transactions.isEmpty ? repository.transactList() : transactions;
        yield BlurInitial(transactions: transactions);
      } catch (_) {
        throw Exception('Что-то пошло не так');
      }
    }
    if (event is MakeBlur) {
      yield BlurDone(transactions: transactions);
    }
  }
}
