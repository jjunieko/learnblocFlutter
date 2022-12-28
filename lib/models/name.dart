import 'package:flutter_bloc/flutter_bloc.dart';

//poderia ser profile com varias coisas
class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void change(String name) => emit(state + name);
}
