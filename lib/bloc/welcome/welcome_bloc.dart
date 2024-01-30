import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<DotsDecoratorEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
