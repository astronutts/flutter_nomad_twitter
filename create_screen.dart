import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_twitter/info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DateTime initialDate = DateTime.now();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _PNEAController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String name = "";
  String pnea = "";
  String birth = "";

  @override
  void initState() {
    super.initState();
    _NameController.addListener(() {
      name = _NameController.text;
      setState(() {});
    });
    _PNEAController.addListener(() {
      pnea = _PNEAController.text;
      setState(() {});
    });
    _birthdayController.addListener(() {
      birth = _birthdayController.text;
      setState(() {});
    });
  }

  bool isNameValid() {
    return name.isNotEmpty;
  }

  bool isPnEaValid() {
    return pnea.isNotEmpty;
  }

  bool isBirthValid() {
    return birth.isNotEmpty;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    super.dispose();
    _NameController.dispose();
    _PNEAController.dispose();
    _birthdayController.dispose();
  }

  Map<String, String> data = {};

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.blue[300],
              size: 40,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Create your account",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _NameController,
                      onSaved: (newValue) {
                        data['Name'] = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please write your name!!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Name",
                        suffixIcon: isNameValid()
                            ? const Icon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.green,
                              )
                            : const Icon(
                                FontAwesomeIcons.circleMinus,
                                color: Colors.red,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _PNEAController,
                      onSaved: (newValue) {
                        data['PhoneEmail'] = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please write your Phone number or Email address!!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Phone number or Email address",
                        suffixIcon: isPnEaValid()
                            ? const Icon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.green,
                              )
                            : const Icon(
                                FontAwesomeIcons.circleMinus,
                                color: Colors.red,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      enabled: false,
                      controller: _birthdayController,
                      onSaved: (newValue) {
                        data['BirthDay'] = newValue!;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Date of Birth",
                        suffixIcon: isBirthValid()
                            ? const Icon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.green,
                              )
                            : const Icon(
                                FontAwesomeIcons.circleMinus,
                                color: Colors.red,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        if (_formkey.currentState != null) {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            if (data['Name']!.isNotEmpty &&
                                data['PhoneEmail']!.isNotEmpty &&
                                data['BirthDay']!.isNotEmpty) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InfoScreen(
                                    name: _NameController.text,
                                    pnea: data['PhoneEmail']!,
                                    birth: data['BirthDay']!,
                                  ),
                                ),
                              );
                            } else {
                              return;
                            }
                          }
                          return;
                        }
                      },
                      color:
                          name.isNotEmpty && pnea.isNotEmpty && birth.isNotEmpty
                              ? Colors.red
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                maximumDate: initialDate,
                initialDateTime: initialDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _setTextFieldDate,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
