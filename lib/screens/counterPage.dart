import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit());
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CounterCubit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosso contador'),
      ),
      body: Center(
          child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Text('$state');
      })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (() => bloc.increment())),
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (() => bloc.decrement())),
        ],
      ),
    );
  }
}
