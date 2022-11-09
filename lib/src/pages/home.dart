import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_joke/src/bloc/joke_bloc.dart';
import 'package:prueba_joke/src/models/joke.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('joke'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        if (state is JokeInitial) {
          return const CircularProgressIndicator();
        }
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: state.model.joke.length,
              itemBuilder: (context, i) {
                return Content(
                  joke: state.model.joke[i],
                );
              },
            ));
      },
    );
  }
}

class Content extends StatelessWidget {
  final Joke joke;
  const Content({Key? key, required this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            child: Image.network(
              'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            joke.url ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.16,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            joke.value ?? '',
            style: const TextStyle(
              color: Color(0xff272727),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.14,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
