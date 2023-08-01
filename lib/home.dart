// 1. Create a new Flutter project and implement the following.
// 2. Bottom navigation bar with 4 Modules.
// 3. Screen one
// a. Put one button named "Fetch Data" and make an api call on
// tap on button to fetch the data from API
// "https://api.publicapis.org/entries".
// b. Create a beautiful ui and make an api call to
// https://api.publicapis.org/entries and fetch all data
// from api and show on screens.
// c. Store whole data of api response to any local database.
// Database not in shared preferences.

import 'package:assignment_app/api.dart';
import 'package:assignment_app/result.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assignment")),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            fetchApi("https://api.publicapis.org/entries").then((value) {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(apiResult: value)));
            });
          },
          child: isLoading ? CircularProgressIndicator() : Text("Fetch Data"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: onNavBtnTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Module 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Module 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Module 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Module 4',
          ),
        ],
      ),
    );
  }

  void onNavBtnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
