import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_twitter/create_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Icon(
                FontAwesomeIcons.twitter,
                color: Colors.blue[300],
                size: 40,
              ),
              const SizedBox(
                height: 170,
              ),
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 60,
              ),
              CupertinoButton(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(30),
                onPressed: () {},
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CupertinoButton(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(30),
                onPressed: () {},
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: 150.0,
                    color: Colors.grey[350],
                  ),
                  const Text("    or    "),
                  Container(
                    height: 1.0,
                    width: 150.0,
                    color: Colors.grey[350],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateScreen()));
                },
                child: const Text(
                  "              Create Account              ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Have an account already?",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Log in",
                style: TextStyle(
                  fontSize: 15,
                ),
              )),
        ],
      )),
    );
  }
}
