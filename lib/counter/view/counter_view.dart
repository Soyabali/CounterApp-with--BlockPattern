import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // BlockBuilder
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            // this is auth to cubit file
            final cubit = context.read<CounterCubit>();
            // to call a interext function
            final interest = cubit.calculateCompoundInterest(
              principal: 1000,
              rate: 5,
              time: state,
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Counter: $state', style: textTheme.displayMedium),
                SizedBox(height: 20),
                Text('Interest: ${interest.toStringAsFixed(2)}', style: textTheme.bodyLarge),
              ],
            );
           // return Text('$state', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            // to call a increment function
            // this is a way to call a function
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            key: const Key('counterView_compoundInterest_floatingActionButton'),
            child: const Icon(Icons.interests),
            onPressed: () => context.read<CounterCubit>().calculateCompoundInterest(principal: 5000, rate: 2, time: 1),
          ),
        ],
      ),
    );
  }
}