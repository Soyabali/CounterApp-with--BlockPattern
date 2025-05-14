import 'package:flutter/material.dart';
import 'counter_observer.dart';
import 'home/counterApp.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(CounterApp());
}