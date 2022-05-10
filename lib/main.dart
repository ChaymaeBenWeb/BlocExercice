import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: HomePage2(),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state is CounterUpdatedState) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              } else {
                return Text('0', style: Theme.of(context).textTheme.headline4);
              }
            }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          FloatingActionButton(
            heroTag: 'IncrementButton',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
             heroTag: 'MultiplyButton',
            onPressed: (){
              BlocProvider.of<CounterBloc>(context)
                  .add(MultiplyEvent());
                 
          },
           tooltip: 'Multiply',
            child: Text ("X2"),
          ),
          

        ],
       
      ),
     

    );
  }
}
