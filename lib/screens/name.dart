import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void change(String name) => emit(state + name);
}

class NameContainer extends StatelessWidget {
  const NameContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit(''),
      child: NameView(),
    );
  }
}

class NameView extends StatelessWidget {
  const NameView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final bloc = NameCubit('');
    _nameController.text = bloc.state;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Change name'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "text",
              ),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('clicar'),
                onPressed: () {
                  final name = _nameController.text;
                  bloc.change(name);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
