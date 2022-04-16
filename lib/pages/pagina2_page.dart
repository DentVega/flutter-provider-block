import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providerblock/bloc/user/user_bloc.dart';
import 'package:providerblock/models/user.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text('Establecer Usuario',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  activateUser(userBloc);
                }),
            MaterialButton(
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(ChangeUserAge(25));
                }),
            MaterialButton(
                child: const Text('Añadir Profesion',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(AddProfession(
                      'Profesion 1'));
                }),
          ],
        ),
      ),
    );
  }

  activateUser(UserBloc userBloc) {
    final newUser = User(
      nombre: 'Juan',
      edad: 20,
      profesiones: [
        'Profesion 1',
        'Profesion 2',
        'Profesion 3',
      ],
    );
    userBloc.add(ActivateUser(newUser));
  }
}
