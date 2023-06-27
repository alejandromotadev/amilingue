import 'package:amilingue/Widgets/Navigation/presentation/navigation.dart';
import 'package:amilingue/features/course_home/presentation/pages/home.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffAE70EC),
        body: Center(
          child: Column(
            children: [
              const Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "What do you want to learn?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  width: 310,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            offset: const Offset(0, 4))
                      ]),
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 36,
                      color: Color(0xff636363),
                    ),
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(height: 0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationPage(),
                        ),
                      );
                    },
                    onChanged: (value) {
                      // This is called when the user selects an item.
                      setState(
                        () {
                          dropdownValue = value!;
                        },
                      );
                    },
                    items: list.map<DropdownMenuItem>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          children: [
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
