part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  final Model model;

  const JokeState(this.model);

  @override
  List<Object> get props => [model];
}

class JokeInitial extends JokeState {
  const JokeInitial(Model model) : super(model);
}

class JokeLoaded extends JokeState {
  const JokeLoaded(Model model) : super(model);
}

class JokeError extends JokeState {
  const JokeError(Model model) : super(model);
}

class Model extends Equatable {
  final List<Joke> joke;

  const Model({this.joke = const []});

  Model copyWith({List<Joke>? joke}) {
    return Model(joke: joke ?? []);
  }

  @override
  List<Object> get props => [joke];
}
