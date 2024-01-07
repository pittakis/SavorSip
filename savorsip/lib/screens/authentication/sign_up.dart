import 'package:flutter/material.dart';
import 'package:savorsip/operations/adduser.dart';
import 'package:savorsip/screens/home/home.dart';
import 'package:savorsip/screens/home/my_home_page.dart';

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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  //final _dateOfBirthController = TextEditingController();

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
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
      bool passwordvisibility, Function togglePasswordVisibility) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        obscureText: !passwordvisibility, // Use the provided boolean value
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
              passwordvisibility ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              // Call the provided function to toggle password visibility
              togglePasswordVisibility();
            },
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible; // Toggle the value
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible; // Toggle the value
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
            _passwordEntryField("password", _passwordController,
                _passwordVisible, _togglePasswordVisibility),
            _passwordEntryField("Confirm password", _confirmPasswordController,
                _confirmPasswordVisible, _toggleConfirmPasswordVisibility),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_firstNameController.text.isEmpty ||
                          _lastNameController.text.isEmpty ||
                          _emailController.text.isEmpty ||
                          _usernameController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _confirmPasswordController.text.isEmpty) {
                        setState(() {
                          _isEmptyField = true;
                        });
                      } else {
                        setState(() {
                          _isEmptyField = false;
                        });
                      }
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        // Set the state to show the error message
                        setState(() {
                          _isPasswordMismatch = true;
                        });
                      } else {
                        // Proceed with navigation if passwords match
                        setState(() {
                          _isPasswordMismatch = false;
                        });
                        if (_isEmptyField == false &&
                            _isPasswordMismatch == false) {
                          addUser(
                              _firstNameController.text,
                              _lastNameController.text,
                              _emailController.text,
                              _usernameController.text,
                              _passwordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        }
                      }
                    },
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
