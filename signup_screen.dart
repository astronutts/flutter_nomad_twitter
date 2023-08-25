import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_twitter/verify_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  final String name, pnea, birth;
  const SignUpScreen(
      {super.key, required this.name, required this.pnea, required this.birth});

  @override
  Widget build(BuildContext context) {
    void _TapSingUp() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VerifyScreen()));
    }

    return SafeArea(
      child: GestureDetector(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          initialValue: name,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          initialValue: pnea,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date of birth",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          initialValue: birth,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. Learn more. Others wii be able to find you by email or phone number, when provided, unless you choose otherwies here.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CupertinoButton(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                        onPressed: _TapSingUp,
                        child: const Text(
                          "         Sign up        ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
