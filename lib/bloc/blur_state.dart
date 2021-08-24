part of 'blur_bloc.dart';

abstract class BlurState extends Equatable {
  const BlurState();
}

class Loading extends BlurState {
  @override
  List<Object> get props => [];
}

class BlurInitial extends BlurState {
  final List<Transaction> transactions;

  BlurInitial({this.transactions});
  @override
  List<Object> get props => [transactions];
}

class BlurDone extends BlurState {
  final List<Transaction> transactions;

  BlurDone({this.transactions});
  @override
  List<Object> get props => [transactions];
}
