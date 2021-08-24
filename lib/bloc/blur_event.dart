part of 'blur_bloc.dart';

abstract class BlurEvent extends Equatable {
  const BlurEvent();
}

class AppStart extends BlurEvent {
  @override
  List<Object> get props => [];
}

class MakeBlur extends BlurEvent {
  @override
  List<Object> get props => [];
}
