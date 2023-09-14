import 'package:shared_preferences/shared_preferences.dart';
import 'package:stagetwo_app/model.dart'; // Import the user data model

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Load the user profile data with default values
  static Map<String, String> loadUserProfile() {
    String fullname = _prefs.getString('fullname') ??
        'Adetokunbo Blessing Ibikemi'; // Default value if not found
    String username = _prefs.getString('username') ?? 'Adetokunbo Blessing';
    String github = _prefs.getString('github') ?? 'https://github.com/ibikemi';
    String email = _prefs.getString('email') ?? 'ibikemi2001@gmail.com';
    String about = _prefs.getString('about') ??
        'I am a software developer with hands-on experience in building and testing solutions. Possess experience with 3+ programming language and seeking for a role where I can grow and learn from experienced team members.';
    String skills = _prefs.getString('skills') ?? 'C#, SQL, Flutter';
    String profession = _prefs.getString('profession') ?? 'Software Developer';
    String experience =
        _prefs.getString('experience') ?? 'CyberCore Technologies';
    String interest =
        _prefs.getString('interest') ?? 'Tech Trends, Music and Baking';

    return {
      'fullname': fullname,
      'username': username,
      'github': github,
      'email': email,
      'about': about,
      'skills': skills,
      'profession': profession,
      'experience': experience,
      'interest': interest
    };
  }

  static Future<void> saveUserProfile(
      String fullname,
      String username,
      String github,
      String email,
      String about,
      String skills,
      String profession,
      String experience,
      String interest) async {
    await _prefs.setString('fullname', fullname);
    await _prefs.setString('username', username);
    await _prefs.setString('github', github);
    await _prefs.setString('email', email);
    await _prefs.setString('about', about);
    await _prefs.setString('skills', skills);
    await _prefs.setString('profession', profession);
    await _prefs.setString('experience', experience);
    await _prefs.setString('interest', interest);
  }

  // Retrieve the user data as a UserModel object
  static UserModel getUser() {
    Map<String, String> userDataMap = loadUserProfile();
    return UserModel(
        fullname: userDataMap['fullname'] ?? '',
        username: userDataMap['username'] ?? '',
        github: userDataMap['github'] ?? '',
        email: userDataMap['email'] ?? '',
        about: userDataMap['about'] ?? '',
        skills: userDataMap['skills'] ?? '',
        profession: userDataMap['profession'] ?? '',
        experience: userDataMap['experience'] ?? '',
        interest: userDataMap['interest'] ?? '');
  }
}
