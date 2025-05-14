import 'dart:math';
import 'package:bloc/bloc.dart';


/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
///
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
  // compound function
  double calculateCompoundInterest({
    required double principal,
    required double rate,
    required int time,
    int n = 1, // compounding frequency per year (default: yearly)
  }) {
    return principal * (pow((1 + (rate / (100 * n))), n * time));
  }
}