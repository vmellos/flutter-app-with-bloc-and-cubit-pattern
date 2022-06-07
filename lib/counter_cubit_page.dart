import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newchat/cubit/counter_cubit.dart';
import 'package:newchat/cubit/counter_state.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        String mensagem = 'Oops!';

        switch (state.status) {
          case CounterStatus.initial:
            mensagem = 'Initial';
            break;
          case CounterStatus.add:
            mensagem = 'adicionado um';
            break;
          case CounterStatus.subtract:
            mensagem = 'subtraido um';
            break;
          case CounterStatus.reset:
            mensagem = 'Reiniciado';
            break;
          case CounterStatus.multiply:
            mensagem = 'Multiplicado por 2';
            break;
        }
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(mensagem)));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter with bloc pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocSelector<CounterCubit, CounterState, String>(
                selector: (state) => state.message,
                builder: (context, message) {
                  return Text(message);
                },
              ),
              BlocSelector<CounterCubit, CounterState, int>(
                selector: (state) => state.counterValue,
                builder: (context, int counter) {
                  return Text('$counter',
                      style: Theme.of(context).textTheme.headline4);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 5,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().adicionar();
                        },
                        child: const Text("Adicionar")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().subtract();
                        },
                        child: const Text("Subtrair")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().reset();
                        },
                        child: const Text("Reiniciar")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().multiply(2);
                        },
                        child: const Text("Multiplicar por 2")),
                  ],
                ),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
