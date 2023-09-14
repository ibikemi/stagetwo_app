import 'package:flutter/material.dart';
import 'package:stagetwo_app/model.dart';
import 'package:stagetwo_app/sharedpreference.dart';
import 'package:stagetwo_app/editcv.dart';

class ViewCV extends StatefulWidget {
  const ViewCV({Key? key}) : super(key: key);

  @override
  State<ViewCV> createState() => _ViewCVState();
}

class _ViewCVState extends State<ViewCV> {
  late UserModel user = user;
  bool dataUpdated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dataUpdated = true) {
      // Data was updated, refresh user data
      loadUserData();
    }
    return ListView(
      children: [
        buildName(user),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {
              // Navigate to the edit profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(user: user),
                ),
              );
            },
            child: const Text('Edit Profile'),
          ),
        ),
      ],
    );
  }

  Future<void> loadUserData() async {
    final updatedUser = await SharedPreferencesHelper.getUser();
    setState(() {
      user = updatedUser; // Update the user data in the state
      dataUpdated = false; // Reset the flag
    });
  }
}

Widget buildName(UserModel user) => Center(
      child: Column(
        children: [
          Text(
            user.fullname,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            user.username,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 6),
          Text(
            user.github,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 6),
          Text(
            user.email,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  user.about,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Technical Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  user.skills,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Work Experience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  user.profession,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Employer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  user.experience,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interests',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  user.interest,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
