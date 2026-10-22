import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemapp/blocs/movie/movie_bloc.dart';
import 'package:cinemapp/misc/constants.dart';
import 'package:cinemapp/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(
          movieRepository: context.read(),
        )..fetch(),
        child: Scaffold(
          body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) => switch (state) {
              FetchingMovieState() => const LoadingWidget(),
              FetchedMovieState(:final movies) => PageView.builder(
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: CachedNetworkImage(
                              imageUrl: '${K.baseImageUrl}${movie.poster}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16.0,
                            32.0,
                            16.0,
                            16.0,
                          ),
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            movie.overview,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.75,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: movies.length,
                ),
              NoneMovieState() => const Center(
                  child: Text('No movies found'),
                ),
              ErrorFetchingMovieState() => const Center(
                  child: Text('An error occurred'),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      );
}
