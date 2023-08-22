import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_twitter/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoScreen extends StatelessWidget {
  final String name, pnea, birth;
  final bool _isChecked = false;
  const InfoScreen({
    super.key,
    required this.name,
    required this.pnea,
    required this.birth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Customize your experience",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Track where you see Twittter content across the web",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                const Text(
                  "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                CupertinoSwitch(value: !_isChecked, onChanged: (value) {})
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            CupertinoButton(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 1, 6, 32),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) =>
                          SignUpScreen(name: name, pnea: pnea, birth: birth)),
                    ),
                  );
                },
                child: const Text(
                  "        Next        ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
