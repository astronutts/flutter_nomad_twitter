import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_twitter/end_screen.dart';
import 'package:flutter_study_twitter/widget/interest_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({
    super.key,
  });

  static const musicinterests = [
    "Rap",
    "R&B & soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDM",
    "Music news",
    "Hip hop",
    "Reggae",
    "Samba",
    "J-pop"
  ];

  static const Enterinterests = [
    "Anime",
    "Movies&TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Nature",
    "Singer",
    "Holly wood",
    "Star wars",
    "DC Comics",
  ];

  List interestList = [];

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
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "What do you want to see on Twitter?",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      for (var interest in musicinterests)
                        InterestButton(
                          interest: interest,
                          interestList: interestList,
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Entertainment",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      for (var interest in Enterinterests)
                        InterestButton(
                          interest: interest,
                          interestList: interestList,
                        )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          color: Colors.black,
                          child: const Text("Next"),
                          onPressed: () {
                            if (interestList.length >= 3) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const EndScreen()),
                                ),
                              );
                            } else {
                              return;
                            }
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
