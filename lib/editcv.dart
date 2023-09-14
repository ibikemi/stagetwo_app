import 'package:flutter/material.dart';
import 'package:stagetwo_app/model.dart';
import 'package:stagetwo_app/sharedpreference.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({required this.user});
  final UserModel user;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController githubController;
  late TextEditingController emailController;
  late TextEditingController aboutController;
  late TextEditingController skillsController;
  late TextEditingController professionController;
  late TextEditingController experienceController;
  late TextEditingController interestController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.fullname);
    usernameController = TextEditingController(text: widget.user.username);
    githubController = TextEditingController(text: widget.user.github);
    emailController = TextEditingController(text: widget.user.email);
    aboutController = TextEditingController(text: widget.user.about);
    skillsController = TextEditingController(text: widget.user.skills);
    professionController = TextEditingController(text: widget.user.profession);
    experienceController = TextEditingController(text: widget.user.experience);
    interestController = TextEditingController(text: widget.user.interest);
  }

  @override
  void dispose() {
    // Dispose of controllers when the page is no longer needed
    nameController.dispose();
    usernameController.dispose();
    // Dispose of controllers for other fields as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Resume')),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 15),
            children: [
              const Text(
                'Name:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Slack Username:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Github:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: githubController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Profile:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                maxLines: 5,
                controller: aboutController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Technical Skills:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: skillsController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Profession:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: professionController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Current Employer: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Interest: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: interestController,
                decoration: InputDecoration(border: inputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    // Save the updated profile data to SharedPreferences
                    SharedPreferencesHelper.saveUserProfile(
                        nameController.text,
                        usernameController.text,
                        githubController.text,
                        emailController.text,
                        aboutController.text,
                        skillsController.text,
                        professionController.text,
                        experienceController.text,
                        interestController.text
                        // Other properties from the text form fields
                        );
                    // Navigate back to the view profile page
                    Navigator.pop(context, true);
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          )),
    );
  }
}

OutlineInputBorder inputBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.black, width: 3));
}
