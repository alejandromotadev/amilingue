import 'package:amilingue/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      //TODO: INYECTAR NUESTRAS DEPENDENCIAS
      //Para inyectar repositorios y casos de uso, ir a dependencies.dart
      providers: buildRepositories(),
      child: MultiBlocProvider(
        providers: [
          //TODO: INYECTAR NUESTROS BLOCS O CUBITS
          //Aqui se inyectan solamente los cubit/blocs
          //ejemplo:
          //BlocProvider(create: (context) => AuthenticationCubit(context.read() #=="el context.read() es para leer PARAMETROS"==#  ))

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(child: Text("HomePage"),),
    );
  }
}
