import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/repository.dart';
import 'bloc/dog_bloc.dart';
import 'bloc/dog_event.dart';
import 'bloc/dog_state.dart';

class DogPage extends StatelessWidget {
  const DogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DogBloc(Repository())..add(GetDogsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dogs"),
          centerTitle: true,
        ),
        body: BlocBuilder<DogBloc, DogState>(
          builder: (context, state) {
            if (state is DogLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is DogLoaded) {
              return ListView.builder(
                itemCount: state.dogs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        state.dogs[index].image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }

            if (state is DogError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
