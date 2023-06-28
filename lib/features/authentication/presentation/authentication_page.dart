import 'package:amilingue/Widgets/Navigation/presentation/navigation.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state == AuthenticationState.authenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const NavigationPage()));
        }
      },
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffAE70EC),
            body: Center(
              child: Column(
                children: [
                  const Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Center(
                      child: Text(
                        "AMILINGUE",
                        style: TextStyle(color: Colors.white, fontSize: 38),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 3,
                    child: Card(
                      color: const Color(0xfff5f5f5),
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints viewportConstraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: viewportConstraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          hintText: ('email'),
                                          prefixIcon: Icon(Icons.email,
                                              color: Colors.black)),
                                      textInputAction: TextInputAction.next,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                          hintText: ('password'),
                                          prefixIcon: Icon(Icons.lock,
                                              color: Colors.black)),
                                      textInputAction: TextInputAction.done,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    ElevatedButton(
                                        onPressed: () => context
                                            .read<AuthenticationCubit>()
                                            .loginCubit(emailController.text,
                                                passwordController.text),
                                        child: Text("sign in"))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
