import 'package:amilingue/features/authentication/presentation/form_page.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 65,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 4,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FormView(),
                                  ));
                            },
                            child: const Text(
                              "sign in with google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
