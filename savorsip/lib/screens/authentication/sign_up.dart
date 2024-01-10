import 'package:flutter/material.dart';
import 'package:savorsip/Models/leaderboard.dart';
import 'package:savorsip/screens/home/my_home_page.dart';
import 'package:savorsip/Models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isEmptyField = false;
  bool _isPasswordMismatch = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String _registrationError = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();

  Widget _entryField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 1.0),
          ),
        ),
      ),
    );
  }

  Widget _passwordEntryField(String title, TextEditingController controller,
      bool passwordVisibility, Function togglePasswordVisibility) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        obscureText: !passwordVisibility,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 1.0),
          ),
          labelText: title,
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibility ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => togglePasswordVisibility(),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            _entryField("First Name", _firstNameController),
            _entryField("Last Name", _lastNameController),
            _entryField("username", _usernameController),
            _entryField("email", _emailController),
            _passwordEntryField("password", _passwordController, _passwordVisible, _togglePasswordVisibility),
            _passwordEntryField("Confirm password", _confirmPasswordController, _confirmPasswordVisible, _toggleConfirmPasswordVisibility),
            const SizedBox(height: 15),
            if (_isEmptyField)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'No Field can be empty',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            if (_isPasswordMismatch)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            if (_registrationError.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  _registrationError,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isEmptyField = _firstNameController.text.isEmpty ||
                            _lastNameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty;
                        _isPasswordMismatch = _passwordController.text !=
                            _confirmPasswordController.text;
                      });

                      if (!_isEmptyField && !_isPasswordMismatch) {
                        String result = await Users.addUser(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _usernameController.text,
                            _passwordController.text);

                        if (result == "Success") {
                          // Create a Users object
                          Users newUser = Users(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              username: _usernameController.text,
                              profilePic: "assets/images/profile_pic_default.png",
                              numOfRatings: 0);
                            await LeaderboardService.updateLeaderboard(newUser.uid, newUser.username, newUser.numOfRatings);

                          // Optionally, pass newUser to the next screen or store it using a state management solution
                          //Printing the User Object
                          print("This is the user Object: $newUser");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(userID: newUser.uid,)), // Pass newUser as an argument if needed
                          );
                        } else {
                          setState(() {
                            _registrationError = result;
                          });
                        }
                      }
                    },
                    // Button styling
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF624E99),
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
