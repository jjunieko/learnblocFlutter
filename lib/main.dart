import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }
//   LogObserver.onChange(Cubit cubit, Change change) {
//     print("${cubit.runtimeType} > $change");
//     super.onChange(cubit, change);
//   }
}

class BytebankApp extends StatelessWidget {
  // final cubit = LogObserver;
  // final change = LogObserver;
  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();
    return MaterialApp(
      theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}
