import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> buildRepositories(){
  return[
    //aqui inyectaremos los casos de uso y  repositorios y sus implementaciones
    // EJEMPLO:
    // RepositoryProvider<LoginUseCase>(create: (context)=> LoginUseCase(context.read() #"el context.read() es para que lea los parametros"# ))
    // RepositoryProvider<MyThingRepository>(create: (context)=> MyThingImpl())

  ];
}