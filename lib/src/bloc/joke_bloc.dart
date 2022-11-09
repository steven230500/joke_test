import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_joke/src/models/joke.dart';
import 'package:prueba_joke/src/repository/repository.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends bloc.Bloc<JokeEvent, JokeState> {
  final Respository repository;

  JokeBloc(this.repository) : super(const JokeInitial(Model())) {
    on<LoadJokeEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(JokeEvent event, Emitter<JokeState> emit) async {
    emit(JokeInitial(state.model));

    try {
      final joke = await repository.getJoke();

      emit(JokeLoaded(state.model.copyWith(joke: joke)));
    } catch (_) {
      emit(JokeError(state.model));
    }
  }
}
