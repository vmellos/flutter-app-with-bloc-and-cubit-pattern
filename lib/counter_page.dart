import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newchat/bloc/counter_bloc.dart';
import 'package:newchat/bloc/counter_event.dart';
import 'package:newchat/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<CounterBloc>(context);
    // final bloc = context.read<CounterBloc>();
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        String mensagem = 'Oops!';

        switch (state.status) {
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
              BlocSelector<CounterBloc, CounterState, String>(
                selector: (state) => state.message,
                builder: (context, message) {
                  return Text(message);
                },
              ),
              BlocSelector<CounterBloc, CounterState, int>(
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
                          context.read<CounterBloc>().add(CounterAddEvent());
                        },
                        child: const Text("Adicionar")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterSubtractEvent());
                        },
                        child: const Text("Subtrair")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterResetEvent());
                        },
                        child: const Text("Reiniciar")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterMultiplyEvent(valor: 2));
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
